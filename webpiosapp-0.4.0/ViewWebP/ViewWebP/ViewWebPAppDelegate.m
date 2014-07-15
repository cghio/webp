// Copyright 2010 Google Inc.
//
// This code is licensed under the same terms as WebM:
//  Software License Agreement:  http://www.webmproject.org/license/software/
//  Additional IP Rights Grant:  http://www.webmproject.org/license/additional/
// -----------------------------------------------------------------------------
//
//  ViewWebPAppDelegate.m
//  ViewWebP
//
//  Created by Somnath Banerjee (somnath@google.com)

#import "ViewWebPAppDelegate.h"
#import "RootViewController.h"
#import "WebPImage.h"

@interface ViewWebPAppDelegate()

@property(nonatomic, retain) NSArray *images;

@end

@implementation ViewWebPAppDelegate

@synthesize images = images_;
@synthesize window = window_;
@synthesize navigationController = navigationController_;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:
      (NSDictionary *)launchOptions {
  NSArray* webpFiles =
      [[NSBundle mainBundle] pathsForResourcesOfType:@"webp"
                                         inDirectory:@"gallery"];
  NSMutableArray *images = [NSMutableArray arrayWithCapacity:[webpFiles count]];
  for (NSString* file in webpFiles) {
    WebPImage* image = [[[WebPImage alloc] initFromFile:file] autorelease];
    [images addObject:image];
  }

  self.images = [[[NSArray alloc] initWithArray:images] autorelease];
  self.window.rootViewController = self.navigationController;
  [self.window makeKeyAndVisible];

  return YES;
}

- (void)dealloc {
  [window_ release];
  [navigationController_ release];
  [images_ release];
  [super dealloc];
}

@end
