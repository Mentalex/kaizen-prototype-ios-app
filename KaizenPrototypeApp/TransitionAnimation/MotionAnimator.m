//
//  MotionAnimator.m
//  KaizenPrototypeApp
//
//  Created by Alex Tapia on 02/06/22.
//

#import "MotionAnimator.h"
#import "GalleryViewController.h"
#import "DetailViewController.h"

@implementation MotionAnimator

static BOOL isPresenting;

#pragma mark Private Methods

- (void)animationForPresented:(id<UIViewControllerContextTransitioning>)transitionContext {
  UIView *view = [transitionContext viewForKey:UITransitionContextToViewKey];
  [transitionContext.containerView addSubview:view];
  
  UINavigationController *fromNavVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  GalleryViewController *galleryVC = fromNavVC.viewControllers.firstObject;
  UIView *mediaView = [galleryVC selectedMediaView];
  [transitionContext.containerView addSubview:mediaView];
  
  UINavigationController *toNavVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  DetailViewController *detailVC = toNavVC.viewControllers.firstObject;
  [detailVC.view layoutIfNeeded];
  
  CGRect const initialFrame = mediaView.frame;
  CGRect const finalFrame = [detailVC mediaViewFrame];
  
  double const xScaleFactor = finalFrame.size.width / initialFrame.size.width;
  double const yScaleFactor = finalFrame.size.height / initialFrame.size.height;

  /* Set up initial states */
  view.alpha = 0.0;
  
  /* Perform animation */
  UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc]
                                      initWithDuration:1.0
                                      curve:UIViewAnimationCurveEaseInOut
                                      animations:^{
    view.alpha = 1.0;
    mediaView.transform = CGAffineTransformMakeScale(xScaleFactor, yScaleFactor);
    mediaView.center = CGPointMake(CGRectGetMidX(finalFrame), CGRectGetMidY(finalFrame));
  }];
  
  [animator addCompletion:^(UIViewAnimatingPosition finalPosition) {
    [transitionContext completeTransition:YES];
    [mediaView removeFromSuperview];
  }];
  
  [animator startAnimation];
}

#pragma mark <UIViewControllerAnimatedTransitioning>

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
  return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
  if (isPresenting) {
    [self animationForPresented:transitionContext];
  }
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
