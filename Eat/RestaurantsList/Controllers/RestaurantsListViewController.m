//
//  RestaurantsListViewController.m
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RestaurantsListViewController.h"
#import "RestaurantDetailViewController.h"
#import "RestaurantsListPresenter.h"
#import "RestaurantCollectionViewCell.h"
#import "RestaurantModel.h"
#import "RestaurantsMapViewController.h"
#import "UIHelper.h"

@interface RestaurantsListViewController () <RestaurantsListPresenterProtocol, RestaurantsMapViewProtocol>

@end

@implementation RestaurantsListViewController {

    int currentPageLoaded;
    RestaurantsListPresenter *restaurantsListPresenter;
    RestaurantsMapViewController *restaurantsMapView;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    restaurantsListPresenter = [[RestaurantsListPresenter alloc] init];
    restaurantsListPresenter.delegate = self;
    
    currentPageLoaded = 1;
    
    [restaurantsListPresenter getRestaurantsForRegion:_regionCode andPage:currentPageLoaded];

    [_restaurantsCollectionView registerNib:[UINib nibWithNibName:@"RestaurantCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"restaurantCollectionViewCell"];
    
    [_restaurantsCollectionView registerNib:[UINib nibWithNibName:@"LoaderCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"loaderCollectionViewCell"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Map" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemPressed:)];

}

- (void)rightBarButtonItemPressed:(id)sender {
    [self openMapView];
}

#pragma <RestaurantsListPresenterProtocol>

- (void)showEmptyContainer {
    
    self.restaurantsCollectionView.hidden = YES;
    self.emptyListMessage.hidden = NO;
    self.loadingIndicator.hidden = YES;
}

- (void)showRestaurantsList:(NSArray *)restaurants {
    
    _restaurantsArray = [NSMutableArray arrayWithArray:restaurants];
    [_restaurantsArray addObject:[[RestaurantModel alloc] initLoadingItem]];
    self.restaurantsCollectionView.hidden = NO;
    self.loadingIndicator.hidden = YES;
    [_restaurantsCollectionView reloadData];
    currentPageLoaded++;
}

- (void)addNewSetOfRestaurnats:(NSArray *)restaurants {
    
    [_restaurantsArray addObjectsFromArray:restaurants];
    [_restaurantsArray addObject:[[RestaurantModel alloc] initLoadingItem]];
   
    RestaurantsListViewController* __weak welf = self;

    [_restaurantsCollectionView performBatchUpdates:^{
        
        RestaurantsListViewController* strongSelf = welf;
        if(!strongSelf) return;
        
        NSMutableArray *indexesToReload = [NSMutableArray new];
        NSUInteger start = strongSelf.restaurantsArray.count - restaurants.count - 1;
        NSUInteger end = strongSelf.restaurantsArray.count;
        for(NSUInteger i = start; i < end; i++){
            [indexesToReload addObject:[NSIndexPath indexPathForRow:i inSection:0]];
        }
        
        [strongSelf.restaurantsCollectionView insertItemsAtIndexPaths:indexesToReload];
  
    } completion:^(BOOL finished) {
        RestaurantsListViewController* strongSelf = welf;
        if(!strongSelf) return;
        
        [strongSelf removeLoadingItem];
    }];
    
    currentPageLoaded++;
}

- (void)removeLoadingItem {
    
    for (int i = 0; i < _restaurantsArray.count; i++) {
    
        RestaurantModel *restaurant = (RestaurantModel*) _restaurantsArray[i];
        
        if (restaurant.isLoadingItem) {
            [_restaurantsArray removeObject:restaurant];

            RestaurantsListViewController* __weak welf = self;

            [_restaurantsCollectionView performBatchUpdates:^{
                
                RestaurantsListViewController* strongSelf = welf;
                if(!strongSelf) return;
                
                [strongSelf.restaurantsCollectionView deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:i inSection:0]]];
                
            } completion:^(BOOL finished) {}];
            break;
        }
    }
}

#pragma <RestaurantsMapViewDelegate>

- (void)didTapOnMarkerInfoWindow:(RestaurantModel *)restaurant {
    [self openRestaurnatProfile: restaurant];
}

#pragma <CollectionViewDataSource>

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _restaurantsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell;

    RestaurantModel *restaurant = _restaurantsArray[indexPath.row];
    
    if (restaurant.isLoadingItem) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"loaderCollectionViewCell" forIndexPath:indexPath];
    } else {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"restaurantCollectionViewCell" forIndexPath:indexPath];
        [(RestaurantCollectionViewCell*) cell buildCell:restaurant];
    }
   
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    RestaurantModel *restaurant = _restaurantsArray[indexPath.row];
    return CGSizeMake(self.view.bounds.size.width, restaurant.isLoadingItem ? 30 : 240);
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == _restaurantsArray.count-1) {
        [restaurantsListPresenter getRestaurantsForRegion:_regionCode andPage:currentPageLoaded];
    }
}

#pragma <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self openRestaurnatProfile:(RestaurantModel*) _restaurantsArray[indexPath.row]];
}


- (void)openRestaurnatProfile:(RestaurantModel*)restaurant {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    RestaurantDetailViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"RestaurantDetailViewController"];
    vc.restaurant = restaurant;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)openMapView {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    RestaurantsMapViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"RestaurantsMapViewController"];
    vc.restaurantsArray = _restaurantsArray;
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
