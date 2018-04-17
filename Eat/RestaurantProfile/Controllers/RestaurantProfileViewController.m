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

@interface RestaurantProfileViewController ()<ImagesPagerViewControllerDelegate, UIScrollViewDelegate, RestaurantProfilePresenterProtocol>

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

#pragma mark <ImagesPagerViewControllerDelegate>

- (void)didSwipe:(NSInteger)selectedIndex {
    self.imagesPageControl.currentPage = selectedIndex;
}


@end
