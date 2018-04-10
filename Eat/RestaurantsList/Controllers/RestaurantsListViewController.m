//
//  RestaurantsListViewController.m
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RestaurantsListViewController.h"
#import "RestaurantProfileViewController.h"
#import "RestaurantsListPresenter.h"
#import "RestaurantCollectionViewCell.h"
#import "RestaurantModel.h"
#import "NavigationBarItems.h"
#import "RestaurantsMapView.h"
#import "UIHelper.h"

@interface RestaurantsListViewController () <RestaurantsListPresenterProtocol, NavigationItemProtocol, RestaurantsMapViewProtocol>

@end

@implementation RestaurantsListViewController {

    NSArray *restaurantsArray;
    int page;
    RestaurantsListPresenter *restaurantsListPresenter;
    RestaurantsMapView *restaurantsMapView;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    restaurantsListPresenter = [[RestaurantsListPresenter alloc] init];
    restaurantsListPresenter.delegate = self;
    
    page = 1;
    
    [restaurantsListPresenter getRestaurantsForRegion:_regionCode andPage:page];

    [_restaurantsCollectionView registerNib:[UINib nibWithNibName:@"RestaurantCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"restaurantCollectionViewCell"];
    
    self.paginationLoader.hidden = YES;
    
    self.navigationBarItems.delegate = self;
}

#pragma <RestaurantsListPresenterProtocol>

- (void)didGetRestaurants:(NSArray *)restaurants{
    if (restaurantsArray) {
        NSMutableArray *existingArray = [[NSMutableArray alloc] initWithArray:restaurantsArray];
        [existingArray addObjectsFromArray:restaurants];
        restaurantsArray = existingArray;
        [_restaurantsCollectionView performBatchUpdates:^{
            NSMutableArray *indexesToReload = [NSMutableArray new];
            NSUInteger start = restaurantsArray.count - restaurants.count;
            NSUInteger end = restaurantsArray.count;
            for(NSUInteger i = start; i < end; i++){
                [indexesToReload addObject:[NSIndexPath indexPathForRow:i inSection:0]];
            }
            [_restaurantsCollectionView insertItemsAtIndexPaths:indexesToReload];
        } completion:^(BOOL finished) {}];
    } else {
        restaurantsArray = restaurants;
        self.restaurantsCollectionView.hidden = NO;
        self.navigationBarItems.hidden = NO;
        self.restaurantsCollectionView.alpha = 0;
        [UIView animateWithDuration:1.0 animations:^(void) {
            self.restaurantsCollectionView.alpha = 1;
        }];
        [_restaurantsCollectionView reloadData];
    }
    page++;
}

#pragma <NavigationItemProtocol>

-(void)didSwitchMainView {
    if (restaurantsMapView) {
        [self.navigationBarItems.mainViewSwitchButton setTitle:@"MAP VIEW" forState:UIControlStateNormal];
        [restaurantsMapView removeFromSuperview];
        restaurantsMapView = nil;
    } else {
        restaurantsMapView = [[RestaurantsMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) andRestaurnatsList:restaurantsArray];
        restaurantsMapView.delegate = self;
        [self.view insertSubview:restaurantsMapView atIndex:2];
        [self.navigationBarItems.mainViewSwitchButton setTitle:@"RESTAURANTS" forState:UIControlStateNormal];
    }
}

-(void)didClickFiltersBtn {
    
}

#pragma <UICollectionViewDelegate>

- (void)didTapOnMarkerInfoWindow:(RestaurantModel *)restaurant {
    [self openRestaurnatProfile: restaurant];
}

#pragma <CollectionViewDataSource>

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return restaurantsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    RestaurantCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"restaurantCollectionViewCell" forIndexPath:indexPath];
    
    RestaurantModel *restaurant = restaurantsArray[indexPath.row];
    [cell buildCell:restaurant];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.bounds.size.width, 220);
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == restaurantsArray.count-1) {
        self.paginationLoader.hidden = YES;
        [restaurantsListPresenter getRestaurantsForRegion:_regionCode andPage:page];
    }
}

#pragma <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self openRestaurnatProfile:(RestaurantModel*) restaurantsArray[indexPath.row]];
}

- (void)openRestaurnatProfile:(RestaurantModel*)restaurant {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    RestaurantProfileViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"RestaurantProfileViewController"];
    vc.restaurant = restaurant;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
