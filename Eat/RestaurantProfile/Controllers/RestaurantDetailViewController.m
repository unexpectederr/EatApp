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

NSString *const HEADER_SECTION_TYPE = @"HEADER_SECTION_TYPE";
NSString *const CONTENT_SECTION_TYPE = @"CONTENT_SECTION_TYPE";
NSString *const GENERIC_SECTION_TYPE_ONE = @"GENERIC_SECTION_TYPE_ONE";
NSString *const IMAGES_PAGER_SECTION = @"IMAGES_PAGER_SECTION";
NSString *const BOOK_NOW_SECTION = @"BOOK_NOW_SECTION";
NSString *const GENERIC_SECTION_TYPE_TWO = @"GENERIC_SECTION_TYPE_TWO";
NSString *const RESTAURANT_INFO = @"RESTAURANT_INFO";
NSString *const RESTAURANT_NOTES = @"RESTAURANT_NOTES";
NSString *const RESTAURANTS_BY_CUISINE = @"RESTAURANTS_BY_CUISINE";
NSString *const RESTAURANTS_BY_NEIGHBOURHOOD = @"RESTAURANTS_BY_NEIGHBOURHOOD";

@interface RestaurantDetailViewController () <UITableViewDataSource, UITableViewDelegate, RestaurantProfilePresenterProtocol, SimilarRestaurantsProtocol, NotesSectionProtocol, GenericSectionCollectionCellProtocol>

@end

@implementation RestaurantDetailViewController {
    RestaurantProfilePresenter *restaurantProfilePresenter;
    NSArray *sections;
    NSMutableArray *dataSource;
    NSMutableArray *headerItems;
    NSMutableArray *contentItems;
    NSMutableArray *restaurnatsByCuisine;
    NSMutableArray *restaurnatsByNeighbourhood;
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationItem.title = _restaurant.name;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    sections = [[NSArray alloc] initWithObjects:HEADER_SECTION_TYPE, CONTENT_SECTION_TYPE, nil];

    headerItems = [NSMutableArray arrayWithObjects:IMAGES_PAGER_SECTION, nil];
    
    contentItems = [NSMutableArray arrayWithObjects:
                       GENERIC_SECTION_TYPE_ONE,
                       GENERIC_SECTION_TYPE_TWO,
                       RESTAURANT_INFO,
                       RESTAURANT_NOTES,
                       nil];
    
    dataSource = [[NSMutableArray alloc] init];
    [dataSource addObject:headerItems];
    [dataSource addObject:contentItems];
    
    restaurantProfilePresenter = [[RestaurantProfilePresenter alloc] init];
    restaurantProfilePresenter.delegate = self;
    
    _detailsTableView.delegate = self;
    _detailsTableView.estimatedRowHeight = 200.0;
    _detailsTableView.rowHeight = UITableViewAutomaticDimension;
    _detailsTableView.sectionHeaderHeight = UITableViewAutomaticDimension;
    _detailsTableView.estimatedSectionHeaderHeight = 50;
    _detailsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _detailsTableView.backgroundColor = [UIColor colorWithCGColor:[UIHelper colorFromHexString:@"#F9FAFC"].CGColor];
    _detailsTableView.backgroundView.backgroundColor = [UIColor colorWithCGColor:[UIHelper colorFromHexString:@"#F9FAFC"].CGColor];

    [_detailsTableView registerNib:[UINib nibWithNibName:@"ImagesPagerCell" bundle:nil] forCellReuseIdentifier:@"imagesPagerCell"];

    [_detailsTableView registerNib:[UINib nibWithNibName:@"BookTableCell" bundle:nil] forCellReuseIdentifier:@"bookTableCell"];

    [_detailsTableView registerNib:[UINib nibWithNibName:@"GenericSectionCell" bundle:nil] forCellReuseIdentifier:@"genericSectionCell"];

    [_detailsTableView registerNib:[UINib nibWithNibName:@"RestaurantInfoCell" bundle:nil] forCellReuseIdentifier:@"restaurantInfoCell"];

    [_detailsTableView registerNib:[UINib nibWithNibName:@"NotesCell" bundle:nil] forCellReuseIdentifier:@"notesCell"];

    [_detailsTableView registerNib:[UINib nibWithNibName:@"SimilarRestaurantsCell" bundle:nil] forCellReuseIdentifier:@"similarRestaurantsCell"];
   
    [_detailsTableView registerNib:[UINib nibWithNibName:@"EmptyCell" bundle:nil] forCellReuseIdentifier:@"emptyCell"];
    
    [restaurantProfilePresenter getRestaurantsByRegion:_restaurant.region_id andCusine:_restaurant.cuisine_id];
    [restaurantProfilePresenter getRestaurantsByNeighbourhood:_restaurant.neighborhood_id];
    
}

#pragma mark <RestaurantProfilePresenterProtocol>

- (void)showRestaurantsByCuisine:(NSArray *)restaurants {
    restaurnatsByCuisine = [[NSMutableArray alloc] initWithArray:restaurants];
    [self removeCurrentRestaurantFromList: restaurnatsByCuisine];
    if (restaurnatsByCuisine.count) {
        [contentItems addObject:RESTAURANTS_BY_CUISINE];
        [_detailsTableView reloadData];
    }
}

- (void)showRestaurantsByNeighbourhood:(NSArray *)restaurants {
    restaurnatsByNeighbourhood = [[NSMutableArray alloc] initWithArray:restaurants];
    [self removeCurrentRestaurantFromList: restaurnatsByNeighbourhood];
    if (restaurnatsByNeighbourhood.count) {
        [contentItems addObject:RESTAURANTS_BY_NEIGHBOURHOOD];
        [_detailsTableView reloadData];
    }
}

- (void)removeCurrentRestaurantFromList:(NSMutableArray*)restaurants {
    for (RestaurantModel *restaurant in restaurants) {
        if ([restaurant.id isEqualToString:self.restaurant.id]) {
            [restaurants removeObject:restaurant];
            break;
        }
    }
}

#pragma mark <SimilarRestaurantsProtocol>

-(void)didTapOnRestaurant:(RestaurantModel *)restaurant {
    [self openRestaurnatProfile:restaurant];
}

- (void)openRestaurnatProfile:(RestaurantModel*)restaurant {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    RestaurantDetailViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"RestaurantDetailViewController"];
    vc.restaurant = restaurant;
    [self.navigationController pushViewController:vc animated:YES];
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
    return sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray *)(dataSource[section])).count;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UITableViewCell *cell;
    
    if ([sections[section] isEqualToString:CONTENT_SECTION_TYPE]) {
         cell = [tableView dequeueReusableCellWithIdentifier:@"bookTableCell"];
    } else if ([sections[section] isEqualToString:HEADER_SECTION_TYPE]){
        cell = [tableView dequeueReusableCellWithIdentifier:@"emptyCell"];
    }
    
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    
    NSString *item = ((NSArray *)(dataSource[indexPath.section]))[indexPath.row];

    if ([item isEqualToString:IMAGES_PAGER_SECTION]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"imagesPagerCell" forIndexPath:indexPath];
        [(ImagesPagerCell*) cell buildCell:self.restaurant];
    } else if ([item isEqualToString:GENERIC_SECTION_TYPE_ONE]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"genericSectionCell" forIndexPath:indexPath];
        ((GenericSectionCell*) cell).delegate = self;
        [(GenericSectionCell*) cell buildCell:self.restaurant sectionType:1];
    } else if ([item isEqualToString:GENERIC_SECTION_TYPE_TWO]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"genericSectionCell" forIndexPath:indexPath];
        [(GenericSectionCell*) cell buildCell:self.restaurant sectionType:2];
    } else if ([item isEqualToString:RESTAURANT_INFO]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"restaurantInfoCell" forIndexPath:indexPath];
        [(RestaurantInfoCell*) cell buildCell:self.restaurant];
    } else if ([item isEqualToString:RESTAURANT_NOTES]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"notesCell" forIndexPath:indexPath];
        ((NotesCell*) cell).delegate = self;
        [(NotesCell*) cell buildCell:self.restaurant];
    } else if ([item isEqualToString:RESTAURANTS_BY_CUISINE]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"similarRestaurantsCell" forIndexPath:indexPath];
        ((SimilarRestaurantsCell*) cell).delegate = self;
        [(SimilarRestaurantsCell*) cell buildCell:restaurnatsByCuisine sectionName:[[NSString stringWithFormat:@"Other %@ restaurnats", _restaurant.cuisine_name] uppercaseString]];
    } else if ([item isEqualToString:RESTAURANTS_BY_NEIGHBOURHOOD]) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"similarRestaurantsCell" forIndexPath:indexPath];
        ((SimilarRestaurantsCell*) cell).delegate = self;
        [(SimilarRestaurantsCell*) cell buildCell:restaurnatsByNeighbourhood sectionName:[[NSString stringWithFormat:@"Other restaurnats in %@", _restaurant.neighborhood_name] uppercaseString]];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return UITableViewAutomaticDimension;
}

@end
