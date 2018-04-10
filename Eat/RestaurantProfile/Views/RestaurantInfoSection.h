//
//  RestaiurantInfoSection.h
//  Eat
//
//  Created by Haris Muharemovic on 09/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestaurantInfoSection : UIView
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *restaurnatInfoCollectionViewHeight;

@property (weak, nonatomic) IBOutlet UICollectionView *restaurantInfoCollectionView;

- (void)setUpCollectionView:(NSArray<NSString*>*)infos;

@end
