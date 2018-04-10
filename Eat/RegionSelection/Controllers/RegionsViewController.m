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

@interface RegionsViewController () <RegionsPresenterProtocol>

@end

@implementation RegionsViewController {
    
    NSArray *regionsArray;
    int counter;
    RegionsPresenter *regionsPresenter;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    regionsPresenter = [[RegionsPresenter alloc] init];
    regionsPresenter.delegate = self;
    
    [regionsPresenter getRegions];
    [regionsPresenter getCuisines];
    [regionsPresenter getNeigbourhoods];

    [_regionsCollectionView registerNib:[UINib nibWithNibName:@"RegionCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"regionCollectionViewCell"];

    
}

#pragma <RegionsPresenterProtocol>

- (void)didGetRegions:(NSArray *)regions {
    regionsArray = regions;
    [self showRegionList];
}

- (void)didGetCuisines:(id)response {
    [self showRegionList];
}

- (void)didGetNeigbourhoods:(id)response {
    [self showRegionList];
}

- (void) showRegionList {
    counter++;
    if (counter < 3)
        return;
    self.regionsCollectionView.hidden = NO;
    self.regionsCollectionView.alpha = 0;
    [UIView animateWithDuration:1.0f animations:^{
        self.regionsCollectionView.alpha = 1;
    } completion:nil];
    [self.regionsCollectionView reloadData];
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
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(self.view.bounds.size.width - 100, 75);
}

#pragma <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    RestaurantsListViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"RestaurantsListViewController"];
    vc.regionCode = ((RegionModel*)regionsArray[indexPath.row]).id;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
