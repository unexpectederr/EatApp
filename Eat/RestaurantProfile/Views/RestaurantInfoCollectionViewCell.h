//
//  RestaurantInfoCollectionViewCell.h
//  Eat
//
//  Created by Haris Muharemovic on 09/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestaurantInfoCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *info;

- (void)buildCell:(NSString*)info;

@end
