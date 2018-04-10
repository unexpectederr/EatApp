//
//  RestaurantProfileViewController.m
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RestaurantProfileViewController.h"
#import "ImagesPagerViewController.h"
#import "RestaurantProfilePresenter.h"
#import "TripAdvisorReviewsViewController.h"
#import "NSString+Repeat.h"

@interface RestaurantProfileViewController ()<ImagesPagerViewControllerDelegate, UIScrollViewDelegate, NotesSectionProtocol, RestaurantProfilePresenterProtocol, RestaurantSectionOneProtocol>

@end

@implementation RestaurantProfileViewController {
    
    RestaurantProfilePresenter *restaurantProfilePresenter;

}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationItem.title = _restaurant.name;
    self.navigationItem.backBarButtonItem.title = @"";

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.delegate = self;
    
    restaurantProfilePresenter = [[RestaurantProfilePresenter alloc] init];
    restaurantProfilePresenter.delegate = self;
    
    self.imagesPageControl.numberOfPages = self.restaurant.image_urls.count;
    
    [self bindRestaurantSectionOne];
    [self bindRestaurantSectionTwo];
    [self bindRestaurantInfoSection];
    [self bindNotesSection];
    [self.mainContainer layoutIfNeeded];
    
    /*
     setting up scrollview container height constraint based on header container(images pager) height(250) and main container with dynamic height
     */
    self.scrollViewContainerHeight.constant = self.mainContainer.bounds.size.height + 250;
    
    [restaurantProfilePresenter getRestaurantsByRegion:_restaurant.region_id andCusine:_restaurant.cuisine_id];
    [restaurantProfilePresenter getRestaurantsByNeighbourhood:_restaurant.neighborhood_id];
}

- (void)bindRestaurantSectionOne {
    self.restaurnatSectionOne.delegate = self;
    [self.restaurnatSectionOne setUpRestaurantSectionOne:_restaurant];
}

- (void)bindRestaurantSectionTwo {
    [self.restaurantSectionTwo setUpRestaurantSectionTwo:_restaurant];
}

- (void)bindRestaurantInfoSection {
    NSMutableArray<NSString*> *infos = [[NSMutableArray alloc] init];
    if (_restaurant.payments) {
        NSMutableString *payment = [[NSMutableString alloc] init];
        for (NSString *item in _restaurant.payments) {
            [payment appendFormat:@"%@ ", item];
        }
        [infos addObject:[NSString stringWithFormat:@"Accepts %@", payment]];
    }
    if (_restaurant.good_for) {
        NSMutableString *goodFor = [[NSMutableString alloc] init];
        for (NSString *item in _restaurant.good_for) {
            [goodFor appendFormat:@"%@ ", item];
        }
        [infos addObject:[NSString stringWithFormat:@"Good for %@ ", goodFor]];
    }
    if (_restaurant.valet) {
        [infos addObject:@"Valet Parking"];
    }
    if (_restaurant.smoking) {
        [infos addObject:@"Smoking Allowed"];
    }
    if (_restaurant.alcohol) {
        [infos addObject:@"Serves Alcohol"];
    }
    if (_restaurant.outdoor_seating) {
        [infos addObject:@"Outdoor Seating"];
    }
    [self.restauranInfoSection setUpCollectionView:infos];
    
    /*
     setting up restaurant info section height constraint based on its collectionview height constraint and title lable height(30)
     */
    self.restaurantInfoSectionHeight.constant = self.restauranInfoSection.restaurnatInfoCollectionViewHeight.constant + 30;
}

- (void)bindNotesSection {
    [self.notesSection setUpNotesView:_restaurant.description];
    self.notesSection.delegate = self;
    /*
     setting up notes section height constraint based on its notes label height constraint and title lable height(25)
     */
    self.notesSectionHeight.constant = self.notesSection.noteViewHeight.constant + 25;
}

- (void)bindSimilarRestaurantsByCuisineSection:(NSArray*)restaurants {
    [self.similarRestaurantsCuisineSection setUpSimilarRestaurantsSection:restaurants sectionName:[[NSString stringWithFormat:@"Other %@ restaurnats", _restaurant.cuisine_name] uppercaseString]];
}

- (void)bindSimilarRestaurantsByNeighbourhoodSection:(NSArray*)restaurants {
    [self.similarRestaurantsByNeighbourhoodSection setUpSimilarRestaurantsSection:restaurants sectionName:[[NSString stringWithFormat:@"Other restaurnats in %@", _restaurant.neighborhood_name] uppercaseString]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSString * segueName = segue.identifier;
    
    if ([segueName isEqualToString: @"ImagesPager"]) {
        ImagesPagerViewController *viewPager = (ImagesPagerViewController *) [segue destinationViewController];
        viewPager.imageUrls = _restaurant.image_urls;
        viewPager.dellegate = self;
    }
}

#pragma mark <RestaurantSectionOneProtocol>

- (void)didOpenTripAdvisorReviews {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    TripAdvisorReviewsViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"TripAdvisorReviewsViewController"];
    vc.reviews = _restaurant.reviews;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark <NotesSectionProtocol>

- (void)didExpandCollapseNote {
    /*
     setting up notes section height constraint based on its notes label height constraint and title lable height(25) after expanding and collapsing
     */
    self.notesSectionHeight.constant = self.notesSection.noteViewHeight.constant + 25;
    [self.mainContainer layoutIfNeeded];
    self.scrollViewContainerHeight.constant = self.mainContainer.bounds.size.height + 250;
}

#pragma mark <ImagesPagerViewControllerDelegate>

- (void)didSwipe:(NSInteger)selectedIndex {
    self.imagesPageControl.currentPage = selectedIndex;
}

#pragma mark <RestaurantProfilePresenterProtocol>

-(void)didGetRestaurantsByCuisine:(NSArray *)restaurants {
    [self bindSimilarRestaurantsByCuisineSection:restaurants];
}

-(void)didGetRestaurantsByNeighbourhood:(NSArray *)restaurants {
    [self bindSimilarRestaurantsByNeighbourhoodSection:restaurants];
}

#pragma mark <UIScrollView>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
     /*
      adding parallax effect on header container
      */
    _headerTopConstraint.constant = scrollView.contentOffset.y/2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
