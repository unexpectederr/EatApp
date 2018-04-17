//
//  RestaurantInfoCollectionCell.h
//  Eat
//
//  Created by Haris Muharemovic on 16/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestaurantModel.h"

@interface RestaurantInfoCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *restaurnatInfoCollectionViewHeight;
@property (weak, nonatomic) IBOutlet UICollectionView *restaurantInfoCollectionView;

- (void)buildCell:(RestaurantModel*)restaurant;

@end
