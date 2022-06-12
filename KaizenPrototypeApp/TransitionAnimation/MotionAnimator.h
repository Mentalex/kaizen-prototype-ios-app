//
//  MotionAnimator.h
//  KaizenPrototypeApp
//
//  Created by Alex Tapia on 02/06/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MotionAnimator : NSObject
<
UIViewControllerAnimatedTransitioning
>

@property (nonatomic) BOOL isPresenting;

@end

NS_ASSUME_NONNULL_END
