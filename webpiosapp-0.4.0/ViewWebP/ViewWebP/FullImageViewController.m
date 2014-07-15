// Copyright 2010 Google Inc.
//
// This code is licensed under the same terms as WebM:
//  Software License Agreement:  http://www.webmproject.org/license/software/
//  Additional IP Rights Grant:  http://www.webmproject.org/license/additional/
// -----------------------------------------------------------------------------
//
//  FullImageViewController.m
//  ViewWebP
//
//  Created by Somnath Banerjee (somnath@google.com)

#import "FullImageViewController.h"

@interface FullImageViewController()

@property(nonatomic, retain) UIImage *image;

@end

@implementation FullImageViewController

@synthesize image = image_;
@synthesize imageView = imageView_;

#pragma mark - View lifecycle

- (id)initWithImage:(UIImage *)image {
  if ((self = [super initWithNibName:self.nibName bundle:self.nibBundle])) {
    if (image) {
      self.image = image;
    } else {
      [self release];
      self = nil;
    }
  }
  return self;
}

- (void)dealloc {
  [image_ release];
  [imageView_ release];
  imageView_ = nil;
  [super dealloc];
}

- (void)viewDidUnload {
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  self.imageView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:
    (UIInterfaceOrientation)interfaceOrientation {
  // If not iPad then don't support upside down portrait.
  NSRange range = [[[UIDevice currentDevice] model] rangeOfString:@"iPad"];
  if (range.location == NSNotFound) {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  }

  return YES;
}

// Display the image when view appears.
- (void)viewWillAppear:(BOOL)animated {
  const CGFloat width = self.image.size.width;
  const CGFloat height = self.image.size.height;

  self.imageView.image = self.image;
  self.imageView.bounds = CGRectMake(0, 0, width, height);
  UIScrollView *imageScrollView = (UIScrollView *)self.view;
  imageScrollView.contentSize = self.imageView.bounds.size;

  [super viewWillAppear:animated];
}

@end
