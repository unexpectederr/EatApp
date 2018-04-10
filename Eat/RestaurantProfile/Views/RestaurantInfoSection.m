//
//  RestaiurantInfoSection.m
//  Eat
//
//  Created by Haris Muharemovic on 09/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RestaurantInfoSection.h"
#import "RestaurantInfoCollectionViewCell.h"
#import "UIHelper.h"

@implementation RestaurantInfoSection {
    
    NSArray<NSString*>* restauranInfos;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self initView];
    }
    return self;
}

-(void)initView {
    
    UIView *view = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"RestaurantInfoSection" owner:self options:nil] firstObject];
    [self addSubview:view];
    view.frame = self.bounds;
    
    self.restaurantInfoCollectionView.layer.borderWidth = 1.0f;
    self.restaurantInfoCollectionView.layer.borderColor = [UIColor colorWithCGColor:[UIHelper colorFromHexString:@"#e8e8e8"].CGColor].CGColor;
    self.restaurantInfoCollectionView.layer.cornerRadius = 3.0f;
    self.restaurantInfoCollectionView.layer.masksToBounds = YES;
    
     [_restaurantInfoCollectionView registerNib:[UINib nibWithNibName:@"RestaurantInfoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"restaurantInfoCollectionViewCell"];
}

- (void)setUpCollectionView:(NSArray<NSString*>*)infos {
    restauranInfos = infos;
    [self.restaurantInfoCollectionView reloadData];
    /*
     setting up restaurnat info collectionview height constraint based on number of rows
     */
    self.restaurnatInfoCollectionViewHeight.constant = restauranInfos.count*27 + 20;
}


#pragma <CollectionViewDataSource>

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return restauranInfos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    RestaurantInfoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"restaurantInfoCollectionViewCell" forIndexPath:indexPath];
    
    NSString *info = restauranInfos[indexPath.row];
    [cell buildCell:info];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(self.bounds.size.width, 27);
}

@end
