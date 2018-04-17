//
//  RestaurantsMapView.m
//  Eat
//
//  Created by Haris Muharemovic on 09/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RestaurantsMapViewController.h"
#import "RestaurantMarker.h"
#import "MarkerInfoView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "ImageLoadingManager.h"

@implementation RestaurantsMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.restaurantsMapView.delegate = self;
    
    [self setMarkers];
}

- (void)setMarkers {
    
    NSMutableArray *markers = [[NSMutableArray alloc] init];
    
    for (RestaurantModel *restaurant in self.restaurantsArray) {
        
        if (restaurant.longitude && restaurant.latitude) {
            CLLocationCoordinate2D position = CLLocationCoordinate2DMake(restaurant.latitude, restaurant.longitude);
            RestaurantMarker *marker = [[RestaurantMarker alloc] init];
            marker.restaurant = restaurant;
            marker.position = position;
            marker.title = restaurant.name;
            marker.snippet = restaurant.address_line_1;
            marker.map = self.restaurantsMapView;
            marker.icon = [GMSMarker markerImageWithColor:[UIColor greenColor]];
            [markers addObject:marker];
        }
    }
    
    [self focusMapToShowAllMarkers:markers];
}

- (UIView *)mapView:(GMSMapView *)mapView markerInfoWindow:(RestaurantMarker *)marker {
    
    MarkerInfoView *view = [[MarkerInfoView alloc] init];
    view.frame = CGRectMake(0, 0, 310, 60);
    view.restaurantName.text = marker.restaurant.name;
    view.restaurantAddress.text = marker.restaurant.address_line_1;
    [[ImageLoadingManager sharedInstance] loadImage:marker.restaurant.image_url withImageWidth:view.restaurantImage.bounds.size.width withImageHeight:view.restaurantImage.bounds.size.height complete:^(UIImage *image) {
        view.restaurantImage.image = image;
    }];
    return view;
}

-(void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(RestaurantMarker *)marker {
    [self.delegate didTapOnMarkerInfoWindow:marker.restaurant];
}

- (void)focusMapToShowAllMarkers:(NSArray<GMSMarker*>*) markers {
    
    GMSCoordinateBounds *bounds = [[GMSCoordinateBounds alloc] init];
    for (GMSMarker *marker in markers)
        bounds = [bounds includingCoordinate:marker.position];
    [self.restaurantsMapView animateWithCameraUpdate:[GMSCameraUpdate fitBounds:bounds withPadding:30.0f]];

}

@end
