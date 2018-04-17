//
//  GenericSectionCell.h
//  Eat
//
//  Created by Haris Muharemovic on 17/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestaurantModel.h"

@protocol GenericSectionCollectionCellProtocol

- (void)didOpenTripAdvisorReviews;

@end
@interface GenericSectionCell : UITableViewCell

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewHeightConstraint;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) id<GenericSectionCollectionCellProtocol> delegate;

- (void)buildCell:(RestaurantModel*)restaurant sectionType:(int)type;

@end
