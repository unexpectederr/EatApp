//
//  ViewController.m
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RegionsViewController.h"
#import "RegionsPresenter.h"
#import "RegionCollectionViewCell.h"
#import "RegionModel.h"
#import "RestaurantsListViewController.h"
#import "UIHelper.h"

@import CoreTelephony;

static const int regionCellHeight = 75;

@interface RegionsViewController () <RegionsPresenterProtocol>

@end

@implementation RegionsViewController {
    
    NSArray *regionsArray;
    int counter;
    BOOL listOfNeighbourhoodsAndCuisinesLoaded;
    RegionsPresenter *regionsPresenter;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.regionsCollectionView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    regionsPresenter = [[RegionsPresenter alloc] init];
    regionsPresenter.delegate = self;
    
    [regionsPresenter getRegions];
    [regionsPresenter getCuisines];
    [regionsPresenter getNeigbourhoods];

    [_regionsCollectionView registerNib:[UINib nibWithNibName:@"RegionCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"regionCollectionViewCell"];

//    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
//    CTCarrier *carrier = info.subscriberCellularProvider;
//    carrier.isoCountryCode;
}

#pragma <RegionsPresenterProtocol>

- (void)showRegionsList:(NSArray *)regions {
    regionsArray = regions;
    [self showRegionList];
}

- (void)didGetCuisines:(id)response {
    [self checkIfListOfNeighbourhoodsAndCuisinesLoaded];
}

- (void)didGetNeigbourhoods:(id)response {
    [self checkIfListOfNeighbourhoodsAndCuisinesLoaded];
}

- (void)showRegionList {
    [self.regionsCollectionView reloadData];
}

- (void)checkIfListOfNeighbourhoodsAndCuisinesLoaded {
    counter++;
    if (counter == 2) {
        listOfNeighbourhoodsAndCuisinesLoaded = YES;
        self.loader.hidden = YES;
        [self.regionsCollectionView reloadData];
    }
}

#pragma <CollectionViewDataSource>

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return regionsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    RegionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"regionCollectionViewCell" forIndexPath:indexPath];
    
    RegionModel *region = regionsArray[indexPath.row];
    [cell buildCell:region];
    
    cell.backgroundColor = listOfNeighbourhoodsAndCuisinesLoaded ? [UIColor whiteColor] : [UIColor lightGrayColor];
    cell.userInteractionEnabled = listOfNeighbourhoodsAndCuisinesLoaded ? YES : NO;

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.bounds.size.width - 100, regionCellHeight);
}

#pragma <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    RegionCollectionViewCell *cell = (RegionCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithCGColor:[UIHelper colorFromHexString:@"#74BF7A"].CGColor];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    RestaurantsListViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"RestaurantsListViewController"];
    vc.regionCode = ((RegionModel*)regionsArray[indexPath.row]).id;
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
