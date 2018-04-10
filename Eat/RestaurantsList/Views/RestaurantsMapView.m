//
//  RestaurantsMapView.m
//  Eat
//
//  Created by Haris Muharemovic on 09/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RestaurantsMapView.h"
#import "RestaurantMarker.h"
#import "MarkerInfoView.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation RestaurantsMapView {
    
    NSArray<RestaurantModel*> *restaurantsArray;
    
}

- (id)initWithFrame:(CGRect)frame andRestaurnatsList:(NSArray<RestaurantModel*>*) restaurants {
    restaurantsArray = restaurants;
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

-(void)initView {
    
    UIView *view = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"RestaurantsMapView" owner:self options:nil] firstObject];
    [self addSubview:view];
    view.frame = self.bounds;
    
    self.restaurantsMapView.delegate = self;

    [self setMarkers];
}

- (void)setMarkers {
    
    NSMutableArray *markers = [[NSMutableArray alloc] init];
    
    for (RestaurantModel *restaurant in restaurantsArray) {
        
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
    [view.restaurantImage sd_setImageWithURL:[NSURL URLWithString:marker.restaurant.image_url]];
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
