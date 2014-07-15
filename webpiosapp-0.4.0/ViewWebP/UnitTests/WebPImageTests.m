// Copyright 2011 Google Inc.
//
// This code is licensed under the same terms as WebM:
//  Software License Agreement:  http://www.webmproject.org/license/software/
//  Additional IP Rights Grant:  http://www.webmproject.org/license/additional/
// -----------------------------------------------------------------------------
//
//  WebPImageTests.m
//  WebPImageTests
//
//  Created by Somnath Banerjee (somnath@google.com)

#import <SenTestingKit/SenTestingKit.h>
#import "WebPImage.h"

@interface WebPImageTests : SenTestCase

@property(nonatomic, retain) NSMutableArray *galleryImages;

@end

@implementation WebPImageTests

@synthesize galleryImages = galleryImages_;

- (void)setUp {
  [super setUp];

  NSArray *webpFiles =
      [[NSBundle mainBundle] pathsForResourcesOfType:@"webp"
                                         inDirectory:@"gallery"];
  self.galleryImages = [NSMutableArray arrayWithCapacity:[webpFiles count]];
  for (NSString *file in webpFiles) {
    WebPImage *image = [[[WebPImage alloc] initFromFile:file] autorelease];
    [self.galleryImages addObject:image];
  }
}

- (void)tearDown {
  self.galleryImages = nil;
  [super tearDown];
}

- (void)testNilInializer {
  WebPImage *image = [[[WebPImage alloc] initFromFile:nil] autorelease];
  STAssertNil(image, @"Image should be nil");
}

- (void)testImageName {
  for (int i = 0; i < self.galleryImages.count; i++) {
    const NSString *name1 = [NSString stringWithFormat:@"%d.webp", (i + 1)];
    const NSString *name2 = [[self.galleryImages objectAtIndex:i] name];
    STAssertEqualObjects(name1, name2, @"Image name doesn't match %@", name2);
  }
}

- (void)testThumbnails {
  const int kThumbWidth = 50;
  const int kThumbHeight = 50;

  for (WebPImage *image in self.galleryImages) {
    const int width = (int)image.thumbImage.size.width;
    const int height = (int)image.thumbImage.size.height;
    STAssertEquals(width, kThumbWidth, @"Thumbnail width differs");
    STAssertEquals(height, kThumbHeight, @"Thumbnail height differs");
  }
}

- (void)testFullImages {
  const CGFloat kMinWidth = 512;
  const CGFloat kMinHeight = 360;

  for (WebPImage *image in self.galleryImages) {
    const CGFloat width = image.fullImage.size.width;
    const CGFloat height = image.fullImage.size.height;
    STAssertTrue(width >= kMinWidth, @"Width less than %d", kMinWidth);
    STAssertTrue(height >= kMinHeight, @"Height less than %d", kMinHeight);
  }
}

- (void)testImageContent {
  const char *kGrayImageFile = "gray.webp";
  const int kGrayImageDim = 100;
  const UInt8 kGrayImageColor = 150;

  NSBundle *testBundle = [NSBundle bundleForClass:[self class]];
  NSString *grayImagePath = [testBundle.bundlePath
                             stringByAppendingFormat:@"/%s", kGrayImageFile];

  WebPImage *grayImage = [[[WebPImage alloc] initFromFile:grayImagePath]
                          autorelease];
  STAssertNotNil(grayImage, @"Gray image not loaded");

  const UIImage *image = grayImage.fullImage;
  const int width = (int)image.size.width;
  const int height = (int)image.size.height;
  STAssertEquals(width, kGrayImageDim, @"Gray image width differs");
  STAssertEquals(height, kGrayImageDim, @"Gray image height differs");

  // Check gray image content
  const CGDataProviderRef provider = CGImageGetDataProvider(image.CGImage);
  const CFDataRef bitmapData = CGDataProviderCopyData(provider);
  const UInt8 *data = CFDataGetBytePtr(bitmapData);

  BOOL match = YES;
  const int stride = 4 * width;
  for (int h = 0; h < height; h++) {
    for (int w = 0; w < width; w++) {
      const UInt8 R = data[h * stride + w * 4 + 0];
      const UInt8 G = data[h * stride + w * 4 + 1];
      const UInt8 B = data[h * stride + w * 4 + 2];

      if (R != kGrayImageColor || G != kGrayImageColor ||
          B != kGrayImageColor) {
        NSLog(@"R=%d G=%d B=%d", R, G, B);
        match = false;
      }
    }
  }

  STAssertTrue(match, @"Image data differs");
  CFRelease(bitmapData);
}

@end
