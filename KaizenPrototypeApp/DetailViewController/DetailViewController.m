//
//  DetailViewController.m
//  KaizenPrototypeApp
//
//  Created by Alex Tapia on 01/06/22.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (nonatomic) UIImageView *imageView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupCloseButton];
  [self setupImageView];
}

#pragma mark Private Methods

- (void)setupCloseButton {
  UIBarButtonItem *closeButton = [[UIBarButtonItem alloc] initWithTitle:@"Close"
                                                                  style:UIBarButtonItemStyleDone
                                                                 target:self
                                                                 action:@selector(dismissAction)];
  self.navigationItem.rightBarButtonItem = closeButton;
}

- (void)setupImageView {
  _imageView = [[UIImageView alloc] init];
  _imageView.backgroundColor = [UIColor blueColor];
  _imageView.layer.cornerRadius = 25.0;
  _imageView.layer.masksToBounds = YES;
  _imageView.image = self.image;
  [self.view addSubview:_imageView];
  
  // Set up Constraints, Width and Height relative to Image Aspect Ratio
  [_imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
  NSLayoutConstraint *centerXAnchor = [[_imageView centerXAnchor] constraintEqualToAnchor:self.view.centerXAnchor];
  NSLayoutConstraint *centerYAnchor = [[_imageView centerYAnchor] constraintEqualToAnchor:self.view.centerYAnchor];
  
  /* Resize Image View base on Image Aspect Ration */
  // Since we are updating the `imageView` size base on Aspect Ratio, this is not neccesary.
  //imageView.contentMode = UIViewContentModeScaleAspectFit;
  
  // Calculate Multiplier base on Aspect Ration
  double aspectRatio = self.image.size.height / self.image.size.width;
  double multiplier = 1.0;
  // TODO: Use `frame.size` here is not a good idea (because isn´t the correct size), we need to avoid it.
  if (self.image.size.width > _imageView.frame.size.width || self.image.size.height > _imageView.frame.size.height) {
    multiplier = (aspectRatio > 1) ? (1 / aspectRatio) : (1 * aspectRatio);
  }
  
  NSLayoutConstraint *widthAnchor = [[_imageView widthAnchor] constraintEqualToAnchor:self.view.widthAnchor
                                                                           multiplier:multiplier];
  NSLayoutConstraint *heightAnchor = [[_imageView heightAnchor] constraintEqualToAnchor:self.view.heightAnchor
                                                                             multiplier:multiplier];
  
  [NSLayoutConstraint activateConstraints:@[centerXAnchor, centerYAnchor, widthAnchor, heightAnchor]];
}

- (void)dismissAction {
  [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark Public Methods

- (CGRect)mediaViewFrame {
  CGRect mediaViewFrame = CGRectMake(
                                     _imageView.frame.origin.x,
                                     _imageView.frame.origin.y,
                                     _imageView.frame.size.width,
                                     _imageView.frame.size.height);
  return mediaViewFrame;
}

@end
