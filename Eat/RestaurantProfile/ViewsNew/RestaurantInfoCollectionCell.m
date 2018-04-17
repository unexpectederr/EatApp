//
//  RestaurantInfoCollectionCell.m
//  Eat
//
//  Created by Haris Muharemovic on 16/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RestaurantInfoCollectionCell.h"
#import "UIHelper.h"
#import "RestaurantInfoItemCollectionViewCell.h"

static const int infoItemHeight = 27;

@implementation RestaurantInfoCollectionCell {
    NSArray<NSString*>* restauranInfos;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    _widthConstraint.constant = UIScreen.mainScreen.bounds.size.width;
    
    self.restaurantInfoCollectionView.layer.borderWidth = 1.0f;
    self.restaurantInfoCollectionView.layer.borderColor = [UIColor colorWithCGColor:[UIHelper colorFromHexString:@"#e8e8e8"].CGColor].CGColor;
    self.restaurantInfoCollectionView.layer.cornerRadius = 3.0f;
    self.restaurantInfoCollectionView.layer.masksToBounds = YES;
}

- (void)buildCell:(RestaurantModel*)restaurant {
    
    [_restaurantInfoCollectionView registerNib:[UINib nibWithNibName:@"RestaurantInfoItemCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"restaurantInfoItemCollectionViewCell"];
    
    [self prepareData:restaurant];
}

- (void)setUpCollectionView:(NSArray<NSString*>*)infos {
    restauranInfos = infos;
    [self.restaurantInfoCollectionView reloadData];
    self.restaurnatInfoCollectionViewHeight.constant = restauranInfos.count*infoItemHeight+20;
}

- (void)prepareData:(RestaurantModel*)restaurant {
    NSMutableArray<NSString*> *infos = [[NSMutableArray alloc] init];
    if (restaurant.payments) {
        NSMutableString *payment = [[NSMutableString alloc] init];
        for (NSString *item in restaurant.payments) {
            [payment appendFormat:@"%@ ", item];
        }
        [infos addObject:[NSString stringWithFormat:@"Accepts %@", payment]];
    }
    if (restaurant.good_for) {
        NSMutableString *goodFor = [[NSMutableString alloc] init];
        for (NSString *item in restaurant.good_for) {
            [goodFor appendFormat:@"%@ ", item];
        }
        [infos addObject:[NSString stringWithFormat:@"Good for %@ ", goodFor]];
    }
    if (restaurant.valet) {
        [infos addObject:@"Valet Parking"];
    }
    if (restaurant.smoking) {
        [infos addObject:@"Smoking Allowed"];
    }
    if (restaurant.alcohol) {
        [infos addObject:@"Serves Alcohol"];
    }
    if (restaurant.outdoor_seating) {
        [infos addObject:@"Outdoor Seating"];
    }
    [self setUpCollectionView:infos];
}

#pragma <CollectionViewDataSource>

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return restauranInfos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    RestaurantInfoItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"restaurantInfoItemCollectionViewCell" forIndexPath:indexPath];
    
    NSString *info = restauranInfos[indexPath.row];
    [cell buildCell:info];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.restaurantInfoCollectionView.bounds.size.width, infoItemHeight);
}

@end
