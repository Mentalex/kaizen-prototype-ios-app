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

#pragma mark <UICollectionViewDelegate>

@end
