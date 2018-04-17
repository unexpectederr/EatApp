//
//  SimilarRestaurantsCell.h
//  Eat
//
//  Created by Haris Muharemovic on 17/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimilarRestaurantsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *sectionName;
@property (weak, nonatomic) IBOutlet UICollectionView *restaurantsCollectionView;

- (void)buildCell:(NSArray*)restaurants sectionName:(NSString*)name;

@end
