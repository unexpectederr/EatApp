//
//  SimilarRestaurantsCuisineSection.m
//  Eat
//
//  Created by Haris Muharemovic on 10/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "SimilarRestaurantsSection.h"
#import "RestaurantSmallCollectionViewCell.h"
#import "UIHelper.h"

@implementation SimilarRestaurantsSection {
    
    NSArray *restaurantsArray;

}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self initView];
    }
    return self;
}

-(void)initView {
    
    UIView *view = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"SimilarRestaurantsCuisineSection" owner:self options:nil] firstObject];
    [self addSubview:view];
    view.frame = self.bounds;
    
    self.restaurantsCollectionView.backgroundColor = [UIColor colorWithCGColor:[UIHelper colorFromHexString:@"#F9FAFC"].CGColor];
    
     [_restaurantsCollectionView registerNib:[UINib nibWithNibName:@"RestaurantSmallCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"restaurantCollectionViewCell"];
    
}

- (void)setUpSimilarRestaurantsByCuisineSection:(NSArray*)restaurants {
    restaurantsArray = restaurants;
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
    return CGSizeMake(140, collectionView.bounds.size.height-10);
}

#pragma <UICollectionViewDelegate>

//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    [self openRestaurnatProfile:(RestaurantModel*) restaurantsArray[indexPath.row]];
//}
//
//- (void)openRestaurnatProfile:(RestaurantModel*)restaurant {
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
//    RestaurantProfileViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"RestaurantProfileViewController"];
//    vc.restaurant = restaurant;
//    [self.navigationController pushViewController:vc animated:YES];
//
//}

@end
