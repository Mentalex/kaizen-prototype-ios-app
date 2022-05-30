//
//  MainViewController.m
//  KaizenPrototypeApp
//
//  Created by Alex Tapia on 28/05/22.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

static NSString * const reuseIdentifier = @"Cell";
static double const space = 5.0;

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"Main";
  
  // Register cell classes
  [self.collectionView registerClass:[UICollectionViewCell class]
          forCellWithReuseIdentifier:reuseIdentifier];
  
  // Do any additional setup after loading the view.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier
                                                                         forIndexPath:indexPath];
  
  // Configure the cell
  cell.backgroundColor = [UIColor redColor];
  
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

@end
