//
//  SimilarRestaurantsCell.h
//  Eat
//
//  Created by Haris Muharemovic on 17/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestaurantModel.h"

@protocol SimilarRestaurantsProtocol

- (void)didTapOnRestaurant:(RestaurantModel*)restaurant;

@end

@interface SimilarRestaurantsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *sectionName;
@property (weak, nonatomic) IBOutlet UICollectionView *restaurantsCollectionView;
@property (weak, nonatomic) id<SimilarRestaurantsProtocol> delegate;

- (void)buildCell:(NSArray*)restaurants sectionName:(NSString*)name;

@end
