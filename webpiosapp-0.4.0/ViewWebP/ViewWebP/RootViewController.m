// Copyright 2010 Google Inc.
//
// This code is licensed under the same terms as WebM:
//  Software License Agreement:  http://www.webmproject.org/license/software/
//  Additional IP Rights Grant:  http://www.webmproject.org/license/additional/
// -----------------------------------------------------------------------------
//
//  RootViewController.m
//  ViewWebP
//
//  Created by Somnath Banerjee (somnath@google.com)

#import "RootViewController.h"
#import "FullImageViewController.h"
#import "ViewWebPAppDelegate.h"
#import "WebPImage.h"

@interface RootViewController()

@property(nonatomic, retain) NSArray *images;

@end

@implementation RootViewController

@synthesize images = images_;

// Returns the list of images to be shown in the TableView.
- (NSArray *)images {
  if (!images_) {
    ViewWebPAppDelegate *appDelegate =
        (ViewWebPAppDelegate *) [[UIApplication sharedApplication] delegate];
    images_ = appDelegate.images;
  }

  return images_;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = NSLocalizedString(@"WebP Images", @"title message");
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

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
  return self.images.count;
}

// Customize the cell to display the thumbnail as icon and image name as text.
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"Cell";

  UITableViewCell *cell =
      [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (!cell) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:CellIdentifier] autorelease];
  }

  // Configure the cell.
  WebPImage *imageData = [self.images objectAtIndex:indexPath.row];
  cell.textLabel.text = imageData.name;
  cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  cell.imageView.image = imageData.thumbImage;
  return cell;
}

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  UIImage *fullImage = [[self.images objectAtIndex:indexPath.row] fullImage];
  FullImageViewController *fullImageViewController =
      [[[FullImageViewController alloc] initWithImage:fullImage] autorelease];

  [self.navigationController pushViewController:fullImageViewController
                                       animated:YES];
}

- (void)didReceiveMemoryWarning {
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];

  // Release the loaded images
  for (WebPImage *image in self.images) {
    image.thumbImage = nil;
    image.fullImage = nil;
  }
}

@end
