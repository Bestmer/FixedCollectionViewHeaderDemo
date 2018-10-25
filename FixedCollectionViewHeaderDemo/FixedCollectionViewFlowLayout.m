//
//  FixedCollectionViewFlowLayout.m
//  FixedCollectionViewHeaderDemo
//
//  Created by Roc Kwok on 2018/10/25.
//  Copyright © 2018年 Roc Kwok. All rights reserved.
//

#import "FixedCollectionViewFlowLayout.h"

@implementation FixedCollectionViewFlowLayout

- (instancetype)initWithFixedHeight:(CGFloat)fixedHeight {
    if ([super init]) {
        self.fixedHeight = fixedHeight;
        self.minimumLineSpacing = 1;
        self.minimumInteritemSpacing = 0.0f;
        CGFloat width = [UIScreen mainScreen].bounds.size.width/3 -1;
        CGFloat height = width * 1.35f;
        self.itemSize = CGSizeMake(width, height);
    }
    return self;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *superArray = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    for (UICollectionViewLayoutAttributes *attributes in [superArray mutableCopy]) {
        if ([attributes.representedElementKind isEqualToString:UICollectionElementKindSectionHeader]) {
            [superArray removeObject:attributes];
        }
    }
    [superArray addObject:[super layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]]];
    for (UICollectionViewLayoutAttributes *attributes in superArray) {
        if ([attributes.representedElementKind isEqualToString:UICollectionElementKindSectionHeader]) {
            CGRect rect = attributes.frame;
            if (self.collectionView.contentOffset.y + self.fixedHeight - rect.size.height > rect.origin.y) {
                rect.origin.y = self.collectionView.contentOffset.y + self.fixedHeight - rect.size.height;
                attributes.frame = rect;
            }
            attributes.zIndex = 5;
        }
    }
    return [superArray mutableCopy];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
