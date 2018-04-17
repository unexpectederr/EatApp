//
//  RestaurantDetailViewController.m
//  Eat
//
//  Created by Haris Muharemovic on 17/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RestaurantDetailViewController.h"
#import "RestaurantInfoCell.h"
#import "TripAdvisorReviewsViewController.h"
#import "RestaurantProfilePresenter.h"
#import "NotesCell.h"
#import "SimilarRestaurantsCell.h"
#import "ImagesPagerCell.h"
#import "GenericSectionCell.h"
#import "UIHelper.h"
#import "Constants.h"

NSString *const GENERIC_SECTION_TYPE_ONE = @"GENERIC_SECTION_TYPE_ONE";
NSString *const IMAGES_PAGER_SECTION = @"IMAGES_PAGER_SECTION";
NSString *const BOOK_NOW_SECTION = @"BOOK_NOW_SECTION";
NSString *const GENERIC_SECTION_TYPE_TWO = @"GENERIC_SECTION_TYPE_TWO";
NSString *const RESTAURANT_INFO = @"RESTAURANT_INFO";
NSString *const RESTAURANT_NOTES = @"RESTAURANT_NOTES";
NSString *const RESTAURANTS_BY_CUISINE = @"RESTAURANTS_BY_CUISINE";
NSString *const RESTAURANTS_BY_NEIGHBOURHOOD = @"RESTAURANTS_BY_NEIGHBOURHOOD";

@interface RestaurantDetailViewController () <UITableViewDataSource, UITableViewDelegate, RestaurantProfilePresenterProtocol,  NotesSectionProtocol, GenericSectionCollectionCellProtocol>

@end

@implementation RestaurantDetailViewController {
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
    
    collectionItems = [NSMutableArray arrayWithObjects:IMAGES_PAGER_SECTION,
                       BOOK_NOW_SECTION,
                       GENERIC_SECTION_TYPE_ONE,
                       GENERIC_SECTION_TYPE_TWO,
                       RESTAURANT_INFO,
                       RESTAURANT_NOTES,
                       nil];
    
    restaurantProfilePresenter = [[RestaurantProfilePresenter alloc] init];
    restaurantProfilePresenter.delegate = self;
    
    _detailsTableView.delegate = self;
    _detailsTableView.estimatedRowHeight = 200.0;
    _detailsTableView.rowHeight = UITableViewAutomaticDimension;
    _detailsTableView.backgroundColor = [UIColor colorWithCGColor:[UIHelper colorFromHexString:@"#F9FAFC"].CGColor];
    _detailsTableView.backgroundView.backgroundColor = [UIColor colorWithCGColor:[UIHelper colorFromHexString:@"#F9FAFC"].CGColor];

    [_detailsTableView registerNib:[UINib nibWithNibName:@"ImagesPagerCell" bundle:nil] forCellReuseIdentifier:@"imagesPagerCell"];

    [_detailsTableView registerNib:[UINib nibWithNibName:@"BookTableCell" bundle:nil] forCellReuseIdentifier:@"bookTableCell"];

    [_detailsTableView registerNib:[UINib nibWithNibName:@"GenericSectionCell" bundle:nil] forCellReuseIdentifier:@"genericSectionCell"];

    [_detailsTableView registerNib:[UINib nibWithNibName:@"RestaurantInfoCell" bundle:nil] forCellReuseIdentifier:@"restaurantInfoCell"];

    [_detailsTableView registerNib:[UINib nibWithNibName:@"NotesCell" bundle:nil] forCellReuseIdentifier:@"notesCell"];

    [_detailsTableView registerNib:[UINib nibWithNibName:@"SimilarRestaurantsCell" bundle:nil] forCellReuseIdentifier:@"similarRestaurantsCell"];
    
    [restaurantProfilePresenter getRestaurantsByRegion:_restaurant.region_id andCusine:_restaurant.cuisine_id];
    [restaurantProfilePresenter getRestaurantsByNeighbourhood:_restaurant.neighborhood_id];
    
}

#pragma mark <RestaurantProfilePresenterProtocol>

-(void)showRestaurantsByCuisine:(NSArray *)restaurants {
    restaurnatsByCuisine = restaurants;
    [collectionItems addObject:RESTAURANTS_BY_CUISINE];
    [_detailsTableView reloadData];
}

-(void)showRestaurantsByNeighbourhood:(NSArray *)restaurants {
    restaurnatsByNeighbourhood = restaurants;
    [collectionItems addObject:RESTAURANTS_BY_NEIGHBOURHOOD];
    [_detailsTableView reloadData];
}

#pragma mark <NotesSectionProtocol>

-(void)didExpandCollapseNote {
    [_detailsTableView reloadData];
}


#pragma mark <GenericSectionCollectionCellProtocol>

-(void)didOpenTripAdvisorReviews {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    TripAdvisorReviewsViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"TripAdvisorReviewsViewController"];
    vc.reviews = _restaurant.reviews;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma <UICollectionViewDelegate>

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return collectionItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    
    if ([collectionItems[indexPath.row] isEqualToString:IMAGES_PAGER_SECTION]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"imagesPagerCell" forIndexPath:indexPath];
        [(ImagesPagerCell*) cell buildCell:self.restaurant];
    } else if ([collectionItems[indexPath.row] isEqualToString:BOOK_NOW_SECTION]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"bookTableCell" forIndexPath:indexPath];
    } else if ([collectionItems[indexPath.row] isEqualToString:GENERIC_SECTION_TYPE_ONE]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"genericSectionCell" forIndexPath:indexPath];
        ((GenericSectionCell*) cell).delegate = self;
        [(GenericSectionCell*) cell buildCell:self.restaurant sectionType:1];
    } else if ([collectionItems[indexPath.row] isEqualToString:GENERIC_SECTION_TYPE_TWO]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"genericSectionCell" forIndexPath:indexPath];
        [(GenericSectionCell*) cell buildCell:self.restaurant sectionType:2];
    } else if ([collectionItems[indexPath.row] isEqualToString:RESTAURANT_INFO]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"restaurantInfoCell" forIndexPath:indexPath];
        [(RestaurantInfoCell*) cell buildCell:self.restaurant];
    } else if ([collectionItems[indexPath.row] isEqualToString:RESTAURANT_NOTES]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"notesCell" forIndexPath:indexPath];
        ((NotesCell*) cell).delegate = self;
        [(NotesCell*) cell buildCell:self.restaurant];
    } else if ([collectionItems[indexPath.row] isEqualToString:RESTAURANTS_BY_CUISINE]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"similarRestaurantsCell" forIndexPath:indexPath];
        [(SimilarRestaurantsCell*) cell buildCell:restaurnatsByCuisine sectionName:[[NSString stringWithFormat:@"Other %@ restaurnats", _restaurant.cuisine_name] uppercaseString]];
    } else if ([collectionItems[indexPath.row] isEqualToString:RESTAURANTS_BY_NEIGHBOURHOOD]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"similarRestaurantsCell" forIndexPath:indexPath];
        [(SimilarRestaurantsCell*) cell buildCell:restaurnatsByNeighbourhood sectionName:[[NSString stringWithFormat:@"Other restaurnats in %@", _restaurant.neighborhood_name] uppercaseString]];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return UITableViewAutomaticDimension;
}

@end
