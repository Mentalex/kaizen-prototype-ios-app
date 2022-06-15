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

#pragma mark Private Methods

- (void)animationForPresenting:(id<UIViewControllerContextTransitioning>)transitionContext {
  UIView *view = [transitionContext viewForKey:UITransitionContextToViewKey];
  [transitionContext.containerView addSubview:view];
  
  UINavigationController *fromNavVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  GalleryViewController *galleryVC = fromNavVC.viewControllers.firstObject;
  UIView *mediaView = [galleryVC selectedMediaView];
  [transitionContext.containerView addSubview:mediaView];
  
  UINavigationController *toNavVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  DetailViewController *detailVC = toNavVC.viewControllers.firstObject;
  [detailVC.view layoutIfNeeded];
  
  CGRect const finalFrame = [detailVC mediaViewFrame];

  /* Set up initial states */
  [galleryVC hideSelectedCell:YES];
  [detailVC hideMediaView:YES];
  mediaView.layer.masksToBounds = YES;
  view.alpha = 0.0;
  
  /* Perform animation */
  UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc]
                                      initWithDuration:1.0
                                      curve:UIViewAnimationCurveEaseInOut
                                      animations:^{
    view.alpha = 1.0;
    mediaView.frame = finalFrame;
    mediaView.center = CGPointMake(CGRectGetMidX(finalFrame), CGRectGetMidY(finalFrame));
    mediaView.layer.cornerRadius = [detailVC getMediaViewCornerRadius];
  }];
  
  [animator addCompletion:^(UIViewAnimatingPosition finalPosition) {
    [galleryVC hideSelectedCell:NO];
    [detailVC hideMediaView:NO];
    [mediaView removeFromSuperview];
    [transitionContext completeTransition:YES];
  }];
  
  [animator startAnimation];
}

- (void)animationForDismissing:(id<UIViewControllerContextTransitioning>)transitionContext {
  UIView *view = [transitionContext viewForKey:UITransitionContextFromViewKey];

  UINavigationController *fromNavVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  DetailViewController *detailVC = fromNavVC.viewControllers.firstObject;
  
  UINavigationController *toNavVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  GalleryViewController *galleryVC = toNavVC.viewControllers.firstObject;
  UIView *mediaView = [galleryVC selectedMediaView];
  [transitionContext.containerView addSubview:mediaView];
  
  CGRect const initialFrame = [detailVC mediaViewFrame];
  CGRect const finalFrame = mediaView.frame;

  /* Set up initial states */
  [galleryVC hideSelectedCell:YES];
  [detailVC hideMediaView:YES];
  mediaView.frame = initialFrame;
  mediaView.layer.masksToBounds = YES;
  mediaView.layer.cornerRadius = [detailVC getMediaViewCornerRadius];
  
  /* Perform animation */
  UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc]
                                      initWithDuration:1.0
                                      curve:UIViewAnimationCurveEaseInOut
                                      animations:^{
    view.alpha = 0.0;
    mediaView.frame = finalFrame;
    mediaView.center = CGPointMake(CGRectGetMidX(finalFrame), CGRectGetMidY(finalFrame));
    mediaView.layer.cornerRadius = 0.0;
  }];
  
  [animator addCompletion:^(UIViewAnimatingPosition finalPosition) {
    [galleryVC hideSelectedCell:NO];
    [detailVC hideMediaView:NO];
    [mediaView removeFromSuperview];
    [transitionContext completeTransition:YES];
  }];
  
  [animator startAnimation];
}

#pragma mark <UIViewControllerAnimatedTransitioning>

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
  return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
  if (_isPresenting) {
    [self animationForPresenting:transitionContext];
  } else {
    [self animationForDismissing:transitionContext];
  }
}

@end
