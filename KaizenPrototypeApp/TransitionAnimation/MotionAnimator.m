//
//  MotionAnimator.m
//  KaizenPrototypeApp
//
//  Created by Alex Tapia on 02/06/22.
//

#import "MotionAnimator.h"
#import "GalleryViewController.h"

@implementation MotionAnimator

#pragma mark <UIViewControllerAnimatedTransitioning>

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
  return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
  UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  [transitionContext.containerView addSubview:toVC.view];
  
  UINavigationController *fromNavVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  GalleryViewController *galleryVC = fromNavVC.viewControllers.firstObject;
  
  /* Make Scale Transition Animation of the whole ToView (`DetailViewController` view) */
  CGRect initialFrame = [galleryVC selectedMediaViewFrame];
  CGRect finalFrame = toVC.view.frame;

  double xScaleFactor = initialFrame.size.width / finalFrame.size.width;
  double yScaleFactor = initialFrame.size.height / finalFrame.size.height;

  toVC.view.transform = CGAffineTransformMakeScale(xScaleFactor, yScaleFactor);
  toVC.view.center = CGPointMake(CGRectGetMidX(initialFrame), CGRectGetMidY(initialFrame));

  UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc]
                                      initWithDuration:1.0
                                      curve:UIViewAnimationCurveEaseInOut
                                      animations:^{
    toVC.view.transform = CGAffineTransformIdentity;
    toVC.view.center = CGPointMake(CGRectGetMidX(finalFrame), CGRectGetMidY(finalFrame));
  }];
  
  [animator addCompletion:^(UIViewAnimatingPosition finalPosition) {
    [transitionContext completeTransition:YES];
  }];
  
  [animator startAnimation];
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
