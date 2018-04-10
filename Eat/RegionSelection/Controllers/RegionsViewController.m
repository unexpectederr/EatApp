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
#import <SDWebImage/UIImageView+WebCache.h>
#import "RestaurantsListViewController.h"

@interface RegionsViewController () <RegionsPresenterProtocol>

@end

@implementation RegionsViewController {
    
    NSArray *regionsArray;
    RegionsPresenter *regionsPresenter;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    regionsPresenter = [[RegionsPresenter alloc] init];
    regionsPresenter.delegate = self;
    
    [regionsPresenter getRegions];
    
    [_regionsCollectionView registerNib:[UINib nibWithNibName:@"RegionCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"regionCollectionViewCell"];

    
}

-(void)didGetRegions:(NSArray *)regions {
    
    regionsArray = regions;
    [_regionsCollectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    [cell.regionImage sd_setImageWithURL:[NSURL URLWithString:region.image_url] placeholderImage:nil];
    cell.regionName.text = region.name;
    
    cell.layer.cornerRadius = 3.0f;
    cell.layer.borderWidth = 1.0f;
    cell.layer.borderColor = [UIColor colorWithWhite:0.9f alpha:0.65].CGColor;
    cell.layer.masksToBounds = YES;
    
    cell.regionImage.layer.cornerRadius = cell.regionImage.bounds.size.width/2;
    cell.regionImage.layer.masksToBounds = YES;

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(self.view.bounds.size.width - 100, 75);
}

#pragma <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"RestaurantsListViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
