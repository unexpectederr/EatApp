//
//  RestaurantInfoCell.h
//  Eat
//
//  Created by Haris Muharemovic on 17/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestaurantModel.h"

@interface RestaurantInfoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *restaurnatInfoCollectionViewHeight;
@property (weak, nonatomic) IBOutlet UICollectionView *restaurantInfoCollectionView;

- (void)buildCell:(RestaurantModel*)restaurant;

@end
