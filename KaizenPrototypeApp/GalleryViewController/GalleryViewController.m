//
//  GalleryViewController.m
//  KaizenPrototypeApp
//
//  Created by Alex Tapia on 28/05/22.
//

#import "GalleryViewController.h"
#import "GalleryCollectionViewCell.h"
#import "DetailViewController.h"
#import "MotionAnimator.h"

@interface GalleryViewController ()

@property (nonatomic) GalleryCollectionViewCell *selectedCell;

@end

@implementation GalleryViewController

static NSString * const reuseIdentifier = @"Cell";
static double const space = 5.0;

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"Main";
  
  // Register cell classes
  [self.collectionView registerClass:[GalleryCollectionViewCell class]
          forCellWithReuseIdentifier:reuseIdentifier];
}

#pragma mark Methods Implementation

- (UIView *)selectedMediaView {
  UIImageView *selectedImageView = [[UIImageView alloc] initWithImage:_selectedCell.imageView.image];
  
  UIView *superView = [_selectedCell superview];
  selectedImageView.frame = [superView convertRect:_selectedCell.frame toView:nil];
  
  return selectedImageView;
}

- (void)hideSelectedCell:(BOOL)hide {
  [_selectedCell setHidden:hide];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  GalleryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier
                                                                              forIndexPath:indexPath];
  
  // Configure the cell
  cell.imageView.image = [UIImage imageNamed:@"kaala"];
  
  return cell;
}

#pragma mark <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  double const width = (self.view.frame.size.width - (3 * space)) / 2;
  return CGSizeMake(width, width);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
  return UIEdgeInsetsMake(space, space, space, space);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
  return space;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
  return space;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  _selectedCell = (GalleryCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
  
  DetailViewController *detailVC = [[DetailViewController alloc] init];
  detailVC.image = [UIImage imageNamed:@"kaala"];
  
  UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:detailVC];
  navigationVC.view.backgroundColor = [UIColor whiteColor];
  MotionAnimator *animator = [[MotionAnimator alloc] init];
  [navigationVC setTransitioningDelegate:animator];
  [navigationVC setModalPresentationStyle:UIModalPresentationCustom];
  
  [self presentViewController:navigationVC animated:YES completion:nil];
}

@end
