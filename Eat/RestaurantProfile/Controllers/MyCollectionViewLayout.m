//
//  MyCollectionViewLayout.m
//  Eat
//
//  Created by Haris Muharemovic on 17/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "MyCollectionViewLayout.h"

@implementation MyCollectionViewLayout

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset {
    NSInteger page = ceil(proposedContentOffset.x / [self.collectionView frame].size.width);
    return CGPointMake(page * [self.collectionView frame].size.width, 0);
}

@end
