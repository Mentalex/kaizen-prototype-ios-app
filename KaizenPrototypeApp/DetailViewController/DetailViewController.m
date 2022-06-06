//
//  DetailViewController.m
//  KaizenPrototypeApp
//
//  Created by Alex Tapia on 01/06/22.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupCloseButton];
  [self setupImageView];
}

- (void)setupCloseButton {
  UIBarButtonItem *closeButton = [[UIBarButtonItem alloc] initWithTitle:@"Close"
                                                                  style:UIBarButtonItemStyleDone
                                                                 target:self
                                                                 action:@selector(dismissAction)];
  self.navigationItem.rightBarButtonItem = closeButton;
}

- (void)setupImageView {
  UIImageView *imageView = [[UIImageView alloc] init];
  imageView.backgroundColor = [UIColor blueColor];
  [self.view addSubview:imageView];
  
  // Set up Image
  imageView.contentMode = UIViewContentModeScaleAspectFit;
  imageView.image = self.image;
  
  // TODO: Use Aspect Ratio to Re-Size Image View's With and Height
  // double aspectRatio = self.image.size.height / self.image.size.width;
  
  // Set up Constraints, Width and Height relative to Image Aspect Ratio
  [imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
  NSLayoutConstraint *centerXAnchor = [[imageView centerXAnchor] constraintEqualToAnchor:self.view.centerXAnchor];
  NSLayoutConstraint *centerYAnchor = [[imageView centerYAnchor] constraintEqualToAnchor:self.view.centerYAnchor];
  NSLayoutConstraint *widthAnchor = [[imageView widthAnchor] constraintEqualToAnchor:self.view.widthAnchor];
  NSLayoutConstraint *heightAnchor = [[imageView heightAnchor] constraintEqualToAnchor:self.view.heightAnchor];
  [NSLayoutConstraint activateConstraints:@[centerXAnchor, centerYAnchor, widthAnchor, heightAnchor]];
}

- (void)dismissAction {
  [self dismissViewControllerAnimated:YES completion:nil];
}

@end
