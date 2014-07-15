// Copyright 2010 Google Inc.
//
// This code is licensed under the same terms as WebM:
//  Software License Agreement:  http://www.webmproject.org/license/software/
//  Additional IP Rights Grant:  http://www.webmproject.org/license/additional/
// -----------------------------------------------------------------------------
//
//  WebPImageData.h
//  ViewWebP
//
//  Created by Somnath Banerjee (somnath@google.com)
//  Copyright 2011 Google Inc. All rights reserved.

#import <UIKit/UIKit.h>

// Loads an WebP image from the given filePath.
// It converts the full size WebP image to a UIImage object (fullImage). It also
// creates a thumbnail version (50x50) of the image (thumbImage). The file name
// is stored as name of the image.
@interface WebPImage : NSObject

@property(nonatomic, readonly, copy) NSString *name;
@property(nonatomic, retain) UIImage *thumbImage;
@property(nonatomic, retain) UIImage *fullImage;

// This is the designated initializer.
// Returns nil if filePath is nil. If filePath points to an invalid file
// then no image will be loaded in fulImage and thumbImage.
- (id)initFromFile:(NSString *)filePath;

@end
