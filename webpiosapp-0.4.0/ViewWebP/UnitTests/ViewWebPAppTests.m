// Copyright 2011 Google Inc.
//
// This code is licensed under the same terms as WebM:
//  Software License Agreement:  http://www.webmproject.org/license/software/
//  Additional IP Rights Grant:  http://www.webmproject.org/license/additional/
// -----------------------------------------------------------------------------
//
//  ViewWebPAppTests.m
//  ViewWebP
//
//  Created by Somnath Banerjee (somnath@google.com)

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "FullImageViewController.h"
#import "ViewWebPAppDelegate.h"
#import "WebPImage.h"

@interface ViewWebPAppTests : SenTestCase {

 @private
  ViewWebPAppDelegate *appDelegate_;
  UINavigationController *navigationController_;
  // Weak typing. Actual type is RootViewController.
  UITableViewController *tableViewController_;
}
@end

@implementation ViewWebPAppTests

- (void)setUp {
  [super setUp];
  appDelegate_ = [[UIApplication sharedApplication] delegate];
  navigationController_ = appDelegate_.navigationController;
  tableViewController_ =
      (UITableViewController*)navigationController_.topViewController;
}

- (void)testAppDelegate {
  STAssertNotNil(appDelegate_, @"Cannot find application delegate");
  STAssertEquals((int)appDelegate_.images.count, 5,
                 @"Unexpected number of images");
  STAssertNotNil(navigationController_, @"NavigationController is nil");
  STAssertNotNil(tableViewController_, @"TableViewController is nil");
}

- (void)testTableViewController {
  STAssertEqualObjects(tableViewController_.title, @"WebP Images",
                       @"TableViewController title does not match");
  STAssertEquals((int)appDelegate_.images.count,
                 (int)[tableViewController_.tableView numberOfRowsInSection:0],
                 @"Unexpected number of rows in the table");

  UITableView *tableView = tableViewController_.tableView;
  for (int i = 0; i < appDelegate_.images.count; i++) {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
    UITableViewCell *tableCell = [tableViewController_ tableView:tableView
                                           cellForRowAtIndexPath:indexPath];

    WebPImage *origImage = [appDelegate_.images objectAtIndex:i];
    STAssertEqualObjects(origImage.thumbImage, tableCell.imageView.image,
                         @"Cell thumbnail differs");
    STAssertEqualObjects(origImage.name, tableCell.textLabel.text,
                         @"Cell text differs");
  }
}

- (void)testFullImageViewController {
  UITableView *tableView = tableViewController_.tableView;
  for (int i = 0; i < appDelegate_.images.count; i++) {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
    [tableViewController_ tableView:tableView
            didSelectRowAtIndexPath:indexPath];

    FullImageViewController *fullImageViewController =
        (FullImageViewController*)navigationController_.topViewController;

    UIImage *origImage = [[appDelegate_.images objectAtIndex:i] fullImage];
    UIImage *displayedImage = fullImageViewController.imageView.image;
    STAssertEqualObjects(origImage, displayedImage,
                         @"Displayed image is different");

    [navigationController_ popViewControllerAnimated:YES];
  }
}

@end
