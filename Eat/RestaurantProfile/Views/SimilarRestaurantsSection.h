//
//  SimilarRestaurantsCuisineSection.h
//  Eat
//
//  Created by Haris Muharemovic on 10/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimilarRestaurantsSection : UIView

@property (weak, nonatomic) IBOutlet UILabel *sectionName;
@property (weak, nonatomic) IBOutlet UICollectionView *restaurantsCollectionView;

- (void)setUpSimilarRestaurantsSection:(NSArray*)restaurants sectionName:(NSString*)name;

@end
