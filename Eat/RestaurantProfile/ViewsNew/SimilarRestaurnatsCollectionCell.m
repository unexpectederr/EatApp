//
//  SimilarRestaurnatsCollectionCell.m
//  Eat
//
//  Created by Haris Muharemovic on 16/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "SimilarRestaurnatsCollectionCell.h"
#import "RestaurantSmallCollectionViewCell.h"
#import "UIHelper.h"

static const int restaurantCellWidth = 140;

@implementation SimilarRestaurnatsCollectionCell{
    NSArray *restaurantsArray;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    _widthConstraint.constant = UIScreen.mainScreen.bounds.size.width;
    
    self.restaurantsCollectionView.backgroundColor = [UIColor colorWithCGColor:[UIHelper colorFromHexString:@"#F9FAFC"].CGColor];
}

- (void)buildCell:(NSArray*)restaurants sectionName:(NSString*)name {
    
    [_restaurantsCollectionView registerNib:[UINib nibWithNibName:@"RestaurantSmallCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"restaurantCollectionViewCell"];
    
    [self setUpSimilarRestaurantsSection:restaurants sectionName:name];
}

- (void)setUpSimilarRestaurantsSection:(NSArray*)restaurants sectionName:(NSString*)name{
    restaurantsArray = restaurants;
    self.sectionName.text = name;
    [self.restaurantsCollectionView reloadData];
}

#pragma <CollectionViewDataSource>

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return restaurantsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    RestaurantSmallCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"restaurantCollectionViewCell" forIndexPath:indexPath];
    
    RestaurantModel *restaurant = restaurantsArray[indexPath.row];
    [cell buildCell:restaurant];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(restaurantCellWidth, collectionView.bounds.size.height-10);
}

@end
