// Copyright 2010 Google Inc.
//
// This code is licensed under the same terms as WebM:
//  Software License Agreement:  http://www.webmproject.org/license/software/
//  Additional IP Rights Grant:  http://www.webmproject.org/license/additional/
// -----------------------------------------------------------------------------
//
//  FullImageViewController.h
//  ViewWebP
//
//  Created by Somnath Banerjee (somnath@google.com)

#import <UIKit/UIKit.h>

// This class displays a UIImage object. It should be initialized with a
// UIImage object before being used.
@interface FullImageViewController : UIViewController

@property(nonatomic, retain) IBOutlet UIImageView *imageView;

// Initializes the UIViewController with a UIImage that will be displayed by it.
// Returns nil if the input image is nil.
- (id)initWithImage:(UIImage *)image;

@end
