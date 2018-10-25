//
//  FixedCollectionViewFlowLayout.h
//  FixedCollectionViewHeaderDemo
//
//  Created by Roc Kwok on 2018/10/25.
//  Copyright © 2018年 Roc Kwok. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FixedCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) CGFloat fixedHeight;

- (instancetype)initWithFixedHeight:(CGFloat)fixedHeight;

@end
