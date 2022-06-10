//
//  MainViewController.h
//  KaizenPrototypeApp
//
//  Created by Alex Tapia on 28/05/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GalleryViewController : UICollectionViewController <UICollectionViewDelegateFlowLayout>

- (UIView *)selectedMediaView;

@end

NS_ASSUME_NONNULL_END
