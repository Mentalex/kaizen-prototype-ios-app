//
//  MotionAnimator.m
//  KaizenPrototypeApp
//
//  Created by Alex Tapia on 02/06/22.
//

#import "MotionAnimator.h"
#import "GalleryViewController.h"

@implementation MotionAnimator

static BOOL isPresenting;

#pragma mark <UIViewControllerAnimatedTransitioning>

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
  return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
  UIView *view = [transitionContext viewForKey:isPresenting ? UITransitionContextToViewKey : UITransitionContextFromViewKey];
  [transitionContext.containerView addSubview:view];
  
  UINavigationController *fromNavVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  GalleryViewController *galleryVC = fromNavVC.viewControllers.firstObject;
  
  /* Make Scale Transition Animation of the whole ToView (`DetailViewController` view) */
  CGRect const selectedMediaViewFrame = [galleryVC selectedMediaViewFrame];
  CGRect const initialFrame = isPresenting ? selectedMediaViewFrame : view.frame;
  CGRect const finalFrame = isPresenting ? view.frame : selectedMediaViewFrame;
  
  double const initialWidth = initialFrame.size.width;
  double const initialHeight = initialFrame.size.height;
  double const finalWidth = finalFrame.size.width;
  double const finalHeight = finalFrame.size.height;
  
  double const xScaleFactor = isPresenting ? (initialWidth / finalWidth) : (finalWidth / initialWidth);
  double const yScaleFactor = isPresenting ? (initialHeight / finalHeight) : (finalHeight / initialHeight);

  view.transform = CGAffineTransformMakeScale(xScaleFactor, yScaleFactor);
  view.center = CGPointMake(CGRectGetMidX(initialFrame), CGRectGetMidY(initialFrame));

  UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc]
                                      initWithDuration:1.0
                                      curve:UIViewAnimationCurveEaseInOut
                                      animations:^{
    view.transform = CGAffineTransformIdentity;
    view.center = CGPointMake(CGRectGetMidX(finalFrame), CGRectGetMidY(finalFrame));
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
  isPresenting = YES;
  return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
  isPresenting = NO;
  return self;
}

@end
