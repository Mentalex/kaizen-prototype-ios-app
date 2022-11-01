//
//  MotionInteractiveDismissTransition.m
//  KaizenPrototypeApp
//
//  Created by Alex Tapia on 31/10/22.
//

#import "MotionInteractiveDismissTransition.h"

@implementation MotionInteractiveDismissTransition

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
  return 0.25;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
  // no-op
}

#pragma mark - UIViewControllerInteractiveTransitioning

- (void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
  // no-op
}

@end
