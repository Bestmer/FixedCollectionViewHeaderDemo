//
//  ViewController.m
//  FixedCollectionViewHeaderDemo
//
//  Created by Roc Kwok on 2018/10/25.
//  Copyright © 2018年 Roc Kwok. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionViewCell.h"
#import "FixedCollectionViewFlowLayout.h"
#import "MyCollectionReusableHeaderView.h"

#define kFixedBarHeight 40
#define kCollectionViewHeaderHeight 200

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FixedCollectionViewFlowLayout *layout = [[FixedCollectionViewFlowLayout alloc] initWithFixedHeight:kFixedBarHeight];
    self.collectionView.collectionViewLayout = layout;
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([MyCollectionReusableHeaderView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([MyCollectionReusableHeaderView class])];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 21*(arc4random()%(5-1+1)+1);
}

#pragma mark - UICollectionViewDelegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    cell.testLabel.text = [NSString stringWithFormat:@"%ld", indexPath.item];
    cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random() % ((255 - 0 + 1) + 0) / 255.f green:arc4random() % 256 / 255.f blue:arc4random() % 256 / 255.f alpha:1];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        MyCollectionReusableHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([MyCollectionReusableHeaderView class]) forIndexPath:indexPath];
        return header;
    }
    return [UICollectionReusableView new];
}

#pragma mark - UICollectionFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, kCollectionViewHeaderHeight);
}

@end
