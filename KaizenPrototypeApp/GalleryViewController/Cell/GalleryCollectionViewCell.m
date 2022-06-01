//
//  GalleryCollectionViewCell.m
//  KaizenPrototypeApp
//
//  Created by Alex Tapia on 31/05/22.
//

#import "GalleryCollectionViewCell.h"

@implementation GalleryCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self setupView];
  }
  return self;
}

- (void)setupView {
  _imageView = [[UIImageView alloc] init];
  [self.contentView addSubview:_imageView];
  
  [_imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
  NSLayoutConstraint *topAnchor = [[_imageView topAnchor] constraintEqualToAnchor:self.contentView.topAnchor];
  NSLayoutConstraint *rightAnchor = [[_imageView rightAnchor] constraintEqualToAnchor:self.contentView.rightAnchor];
  NSLayoutConstraint *bottomAnchor = [[_imageView bottomAnchor] constraintEqualToAnchor:self.contentView.bottomAnchor];
  NSLayoutConstraint *leftAnchor = [[_imageView leftAnchor] constraintEqualToAnchor:self.contentView.leftAnchor];
  [NSLayoutConstraint activateConstraints:@[topAnchor, rightAnchor, bottomAnchor, leftAnchor]];
}

@end
