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
  imageView.layer.cornerRadius = 25.0;
  imageView.layer.masksToBounds = YES;
  imageView.image = self.image;
  [self.view addSubview:imageView];
  
  // Set up Constraints, Width and Height relative to Image Aspect Ratio
  [imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
  NSLayoutConstraint *centerXAnchor = [[imageView centerXAnchor] constraintEqualToAnchor:self.view.centerXAnchor];
  NSLayoutConstraint *centerYAnchor = [[imageView centerYAnchor] constraintEqualToAnchor:self.view.centerYAnchor];
  
  /* Resize Image View base on Image Aspect Ration */
  // Since we are updating the `imageView` size base on Aspect Ratio, this is not neccesary.
  //imageView.contentMode = UIViewContentModeScaleAspectFit;
  
  // Calculate Multiplier base on Aspect Ration
  double aspectRatio = self.image.size.height / self.image.size.width;
  double multiplier = 1.0;
  // TODO: Use `frame.size` here is not a good idea (because isn´t the correct size), we need to avoid it.
  if (self.image.size.width > imageView.frame.size.width || self.image.size.height > imageView.frame.size.height) {
    multiplier = (aspectRatio > 1) ? (1 / aspectRatio) : (1 * aspectRatio);
  }
  
  NSLayoutConstraint *widthAnchor = [[imageView widthAnchor] constraintEqualToAnchor:self.view.widthAnchor
                                                                          multiplier:multiplier];
  NSLayoutConstraint *heightAnchor = [[imageView heightAnchor] constraintEqualToAnchor:self.view.heightAnchor
                                                                            multiplier:multiplier];
  
  [NSLayoutConstraint activateConstraints:@[centerXAnchor, centerYAnchor, widthAnchor, heightAnchor]];
}

- (void)dismissAction {
  [self dismissViewControllerAnimated:YES completion:nil];
}

@end
