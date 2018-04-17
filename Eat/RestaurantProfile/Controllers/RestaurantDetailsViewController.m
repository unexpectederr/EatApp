//
//  RestaurantDetailsViewController.m
//  Eat
//
//  Created by Haris Muharemovic on 16/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RestaurantDetailsViewController.h"
#import "RestaurantInfoCollectionCell.h"
#import "TripAdvisorReviewsViewController.h"
#import "GenericSectionCollectionCell.h"
#import "RestaurantProfilePresenter.h"
#import "NotesCollectionCell.h"
#import "SimilarRestaurnatsCollectionCell.h"
#import "ImagePagerCollectionCell.h"
#import "BookNowCollectionCell.h"
#import "Constants.h"

NSString *const GENERIC_SECTION_TYPE_ONE = @"GENERIC_SECTION_TYPE_ONE";
NSString *const IMAGES_PAGER_SECTION = @"IMAGES_PAGER_SECTION";
NSString *const BOOK_NOW_SECTION = @"BOOK_NOW_SECTION";
NSString *const GENERIC_SECTION_TYPE_TWO = @"GENERIC_SECTION_TYPE_TWO";
NSString *const RESTAURANT_INFO = @"RESTAURANT_INFO";
NSString *const RESTAURANT_NOTES = @"RESTAURANT_NOTES";
NSString *const RESTAURANTS_BY_CUISINE = @"RESTAURANTS_BY_CUISINE";
NSString *const RESTAURANTS_BY_NEIGHBOURHOOD = @"RESTAURANTS_BY_NEIGHBOURHOOD";

@interface RestaurantDetailsViewController ()<RestaurantProfilePresenterProtocol, NotesSectionProtocol, GenericSectionCollectionCellProtocol>

@end

@implementation RestaurantDetailsViewController {
    RestaurantProfilePresenter *restaurantProfilePresenter;
    NSMutableArray *collectionItems;
    NSArray *restaurnatsByCuisine;
    NSArray *restaurnatsByNeighbourhood;
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationItem.title = _restaurant.name;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    collectionItems = [NSMutableArray arrayWithObjects:IMAGES_PAGER_SECTION, BOOK_NOW_SECTION, GENERIC_SECTION_TYPE_ONE, GENERIC_SECTION_TYPE_TWO, RESTAURANT_NOTES, nil];
    
    restaurantProfilePresenter = [[RestaurantProfilePresenter alloc] init];
    restaurantProfilePresenter.delegate = self;
    
    [_detailsCollectionView registerNib:[UINib nibWithNibName:@"ImagePagerCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"imagePagerCollectionCell"];
    
    [_detailsCollectionView registerNib:[UINib nibWithNibName:@"BookNowCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"bookNowCollectionCell"];
    
     [_detailsCollectionView registerNib:[UINib nibWithNibName:@"GenericSectionCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"genericSectionCollectionCell"];
    
    [_detailsCollectionView registerNib:[UINib nibWithNibName:@"RestaurantInfoCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"restaurantInfoCollectionCell"];
    
    [_detailsCollectionView registerNib:[UINib nibWithNibName:@"NotesCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"notesCollectionCell"];
    
     [_detailsCollectionView registerNib:[UINib nibWithNibName:@"SimilarRestaurnatsCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"similarRestaurnatsCollectionCell"];
    
    [restaurantProfilePresenter getRestaurantsByRegion:_restaurant.region_id andCusine:_restaurant.cuisine_id];
    [restaurantProfilePresenter getRestaurantsByNeighbourhood:_restaurant.neighborhood_id];
    
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout*)_detailsCollectionView.collectionViewLayout;
    flowLayout.estimatedItemSize = CGSizeMake(1, 1);
}

- (void)reloadList {
    CGPoint contentOffset = CGPointMake(_detailsCollectionView.contentOffset.x, _detailsCollectionView.contentOffset.y);
    [_detailsCollectionView reloadData];
    //for some reason, when reloading cellectionview scrolls to top, so I made this workaround
    //didn't have enough time to deal with it properly
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.0001f * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [_detailsCollectionView setContentOffset:contentOffset animated:NO];
    });
}

#pragma mark <RestaurantProfilePresenterProtocol>

-(void)showRestaurantsByCuisine:(NSArray *)restaurants {
    restaurnatsByCuisine = restaurants;
    [collectionItems addObject:RESTAURANTS_BY_CUISINE];
    [self reloadList];
}

-(void)showRestaurantsByNeighbourhood:(NSArray *)restaurants {
    restaurnatsByNeighbourhood = restaurants;
    [collectionItems addObject:RESTAURANTS_BY_NEIGHBOURHOOD];
    [self reloadList];
}

#pragma mark <NotesSectionProtocol>

-(void)didExpandCollapseNote {
    [self reloadList];
}


#pragma mark <GenericSectionCollectionCellProtocol>

-(void)didOpenTripAdvisorReviews {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    TripAdvisorReviewsViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"TripAdvisorReviewsViewController"];
    vc.reviews = _restaurant.reviews;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma <UICollectionViewDelegate>

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return collectionItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell;
    
    if ([collectionItems[indexPath.row] isEqualToString:IMAGES_PAGER_SECTION]) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imagePagerCollectionCell" forIndexPath:indexPath];
        [(ImagePagerCollectionCell*) cell buildCell:self.restaurant];
    } else if ([collectionItems[indexPath.row] isEqualToString:BOOK_NOW_SECTION]) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"bookNowCollectionCell" forIndexPath:indexPath];
    } else if ([collectionItems[indexPath.row] isEqualToString:GENERIC_SECTION_TYPE_ONE]) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"genericSectionCollectionCell" forIndexPath:indexPath];
        [(GenericSectionCollectionCell*) cell buildCell:self.restaurant sectionType:1];
    } else if ([collectionItems[indexPath.row] isEqualToString:GENERIC_SECTION_TYPE_TWO]) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"genericSectionCollectionCell" forIndexPath:indexPath];
        ((GenericSectionCollectionCell*) cell).delegate = self;
        [(GenericSectionCollectionCell*) cell buildCell:self.restaurant sectionType:2];
    } else if ([collectionItems[indexPath.row] isEqualToString:RESTAURANT_INFO]) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"restaurantInfoCollectionCell" forIndexPath:indexPath];
        [(RestaurantInfoCollectionCell*) cell buildCell:self.restaurant];
    } else if ([collectionItems[indexPath.row] isEqualToString:RESTAURANT_NOTES]) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"notesCollectionCell" forIndexPath:indexPath];
        ((NotesCollectionCell*) cell).delegate = self;
        [(NotesCollectionCell*) cell buildCell:self.restaurant];
    } else if ([collectionItems[indexPath.row] isEqualToString:RESTAURANTS_BY_CUISINE]) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"similarRestaurnatsCollectionCell" forIndexPath:indexPath];
        [(SimilarRestaurnatsCollectionCell*) cell buildCell:restaurnatsByCuisine sectionName:[[NSString stringWithFormat:@"Other %@ restaurnats", _restaurant.cuisine_name] uppercaseString]];
    } else if ([collectionItems[indexPath.row] isEqualToString:RESTAURANTS_BY_NEIGHBOURHOOD]) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"similarRestaurnatsCollectionCell" forIndexPath:indexPath];
        [(SimilarRestaurnatsCollectionCell*) cell buildCell:restaurnatsByNeighbourhood sectionName:[[NSString stringWithFormat:@"Other restaurnats in %@", _restaurant.neighborhood_name] uppercaseString]];
    }
    
    return cell;
}

@end
