// Copyright 2010 Google Inc.
//
// This code is licensed under the same terms as WebM:
//  Software License Agreement:  http://www.webmproject.org/license/software/
//  Additional IP Rights Grant:  http://www.webmproject.org/license/additional/
// -----------------------------------------------------------------------------
//
//  ViewWebPAppDelegate.h
//  ViewWebP
//
//  Created by Somnath Banerjee (somnath@google.com)

#import <UIKit/UIKit.h>

@class RootViewController;

@interface ViewWebPAppDelegate : NSObject <UIApplicationDelegate>

// List of images to be shown in the TableView.
@property(nonatomic, readonly, retain) NSArray *images;
@property(nonatomic, retain) IBOutlet UIWindow *window;
@property(nonatomic, retain) IBOutlet
    UINavigationController *navigationController;

@end
