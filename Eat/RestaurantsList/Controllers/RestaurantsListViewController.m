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
#import "UIHelper.h"

@interface RestaurantsListViewController () <RestaurantsListPresenterProtocol, NavigationItemProtocol>

@end

@implementation RestaurantsListViewController {

    NSArray *restaurantsArray;
    RestaurantsListPresenter *restaurantsListPresenter;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    restaurantsListPresenter = [[RestaurantsListPresenter alloc] init];
    restaurantsListPresenter.delegate = self;
    
    [restaurantsListPresenter getRestaurantsForRegion:_regionCode];
    
    [_restaurantsCollectionView registerNib:[UINib nibWithNibName:@"RestaurantCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"restaurantCollectionViewCell"];
    
    self.navigationBarItems.delegate = self;
}

#pragma <RestaurantsListPresenterProtocol>

- (void)didGetRestaurants:(NSArray *)restaurants{
    
    restaurantsArray = restaurants;
    [_restaurantsCollectionView reloadData];
}

#pragma <NavigationItemProtocol>

-(void)didSwitchMainView {
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, 200, 300);
    view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:view];
}

-(void)didClickFiltersBtn {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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

#pragma <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    RestaurantProfileViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"RestaurantProfileViewController"];
    vc.restaurant = (RestaurantModel*) restaurantsArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
