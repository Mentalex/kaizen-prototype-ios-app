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
  imageView.image = self.image;
  [self.view addSubview:imageView];
  
  [imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
  NSLayoutConstraint *topAnchor = [[imageView topAnchor] constraintEqualToAnchor:self.view.topAnchor];
  NSLayoutConstraint *rightAnchor = [[imageView rightAnchor] constraintEqualToAnchor:self.view.rightAnchor];
  NSLayoutConstraint *bottomAnchor = [[imageView bottomAnchor] constraintEqualToAnchor:self.view.bottomAnchor];
  NSLayoutConstraint *leftAnchor = [[imageView leftAnchor] constraintEqualToAnchor:self.view.leftAnchor];
  [NSLayoutConstraint activateConstraints:@[topAnchor, rightAnchor, bottomAnchor, leftAnchor]];
}

- (void)dismissAction {
  [self dismissViewControllerAnimated:YES completion:nil];
}

@end
