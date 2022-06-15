//
//  DetailViewController.h
//  KaizenPrototypeApp
//
//  Created by Alex Tapia on 01/06/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

@property (strong, nonatomic) UIImage *image;

- (CGRect)mediaViewFrame;
- (void)hideMediaView:(BOOL)hide;
- (CGFloat)getMediaViewCornerRadius;

@end

NS_ASSUME_NONNULL_END
