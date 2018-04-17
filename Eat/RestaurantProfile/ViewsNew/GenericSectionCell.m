//
//  GenericSectionCell.m
//  Eat
//
//  Created by Haris Muharemovic on 17/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "GenericSectionCell.h"
#import "GenericSectionItemModel.h"
#import "UIHelper.h"
#import "GenericSectionItemCollectionViewCell.h"
#import "NSString+Repeat.h"

static const int sectionItemHeight = 50;

@implementation GenericSectionCell{
    NSMutableArray<GenericSectionItemModel*>* itemsArray;
}

- (void)awakeFromNib {
    [super awakeFromNib];
   
    self.collectionView.layer.borderWidth = 1.0f;
    self.collectionView.layer.borderColor = [UIColor colorWithCGColor:[UIHelper colorFromHexString:@"#e8e8e8"].CGColor].CGColor;
    self.collectionView.layer.cornerRadius = 3.0f;
    self.collectionView.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)buildCell:(RestaurantModel*)restaurant sectionType:(int)type {
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"GenericSectionItemCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"genericSectionItemCollectionViewCell"];
    
    if (type == 1) {
        [self prepareDataForSectionOne:restaurant];
    } else if (type == 2){
        [self prepareDataForSectionTwo:restaurant];
    }
}

- (void)prepareDataForSectionOne:(RestaurantModel*)restaurant {
    itemsArray = [[NSMutableArray alloc] init];
    if (restaurant.rating.number_of_ratings) {
        GenericSectionItemModel *item = [[GenericSectionItemModel alloc] initWithTitle:[NSString stringWithFormat:@"%d TripAdvisorReviews", restaurant.rating.number_of_ratings] andIcon:[UIImage imageNamed:@"trip_advisor_color"] andType:@"TRIP_ADVISOR" isClickable:YES];
        [itemsArray addObject:item];
    }
    if (restaurant.address_line_1) {
        GenericSectionItemModel *item = [[GenericSectionItemModel alloc] initWithTitle:restaurant.address_line_1 andIcon:[UIImage imageNamed:@"location_icon"] andType:@"" isClickable:NO];
        [itemsArray addObject:item];
    }
    if (restaurant.menu_url) {
        GenericSectionItemModel *item = [[GenericSectionItemModel alloc] initWithTitle:@"Restaurant Menu" andIcon:[UIImage imageNamed:@"menu"] andType:@"RESTAURANT_MENU" isClickable:YES];
        [itemsArray addObject:item];
    }
    [self setUpCollectionView:itemsArray];
}

- (void)prepareDataForSectionTwo:(RestaurantModel*)restaurant {
    itemsArray = [[NSMutableArray alloc] init];
    if (restaurant.establishment_type) {
        GenericSectionItemModel *item = [[GenericSectionItemModel alloc] initWithTitle:restaurant.establishment_type andIcon:[UIImage imageNamed:@"establishment_icon"] andType:@"" isClickable:NO];
        [itemsArray addObject:item];
    }
    if (restaurant.price_level) {
        GenericSectionItemModel *item = [[GenericSectionItemModel alloc] initWithTitle:[@"$" repeatTimes:restaurant.price_level] andIcon:[UIImage imageNamed:@"price_icon"] andType:@"" isClickable:NO];
        [itemsArray addObject:item];
    }
    if (restaurant.attire) {
        GenericSectionItemModel *item = [[GenericSectionItemModel alloc] initWithTitle:restaurant.attire andIcon:[UIImage imageNamed:@"attire_icon"] andType:@"" isClickable:NO];
        [itemsArray addObject:item];
    }
    [self setUpCollectionView:itemsArray];
}

- (void)setUpCollectionView:(NSMutableArray<GenericSectionItemModel*>*)items {
    itemsArray = items;
    [self.collectionView reloadData];
    self.collectionViewHeightConstraint.constant = items.count*(sectionItemHeight+1);
}

#pragma <CollectionViewDataSource>

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return itemsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GenericSectionItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"genericSectionItemCollectionViewCell" forIndexPath:indexPath];
    
    GenericSectionItemModel *item = itemsArray[indexPath.row];
    [cell buildCell:item];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.collectionView.bounds.size.width, sectionItemHeight);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    GenericSectionItemModel *item = itemsArray[indexPath.row];
    if ([item.type isEqualToString:@"TRIP_ADVISOR"])
        [self.delegate didOpenTripAdvisorReviews];
}

@end
