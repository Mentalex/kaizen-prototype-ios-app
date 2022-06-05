//
//  MotionAnimator.m
//  KaizenPrototypeApp
//
//  Created by Alex Tapia on 02/06/22.
//

#import "MotionAnimator.h"

@implementation MotionAnimator

#pragma mark <UIViewControllerAnimatedTransitioning>

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
  return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
  UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  [transitionContext.containerView addSubview:toVC.view];
  
  toVC.view.alpha = 0;
  [UIViewPropertyAnimator runningPropertyAnimatorWithDuration:1.0
                                                        delay:0.0
                                                      options:UIViewAnimationOptionCurveEaseInOut
                                                   animations:^{
    toVC.view.alpha = 1;
  } completion:^(UIViewAnimatingPosition finalPosition) {
    [transitionContext completeTransition:YES];
  }];
}

#pragma mark <UIViewControllerTransitioningDelegate>

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
  
  return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
  return nil;
}

@end
