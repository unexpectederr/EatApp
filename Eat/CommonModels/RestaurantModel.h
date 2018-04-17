//
//  RestaurantModel.h
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "ReviewModel.h"
#import "RatingModel.h"

@protocol ReviewModel
@end

@interface RestaurantModel : JSONModel

@property (copy, nonatomic) NSString* id;
@property (copy, nonatomic) NSString* key;
@property (copy, nonatomic) NSString* name;
@property (copy, nonatomic) NSString* country_code;
@property (copy, nonatomic) NSString* image_url;
@property (copy, nonatomic) NSArray<NSString*>* image_urls;
@property (copy, nonatomic) NSString<Optional>* cuisine_id;
@property (copy, nonatomic) NSString<Optional>* cuisine_name;
@property (copy, nonatomic) NSString<Optional>* neighborhood_id;
@property (copy, nonatomic) NSString<Optional>* neighborhood_name;
@property (assign, nonatomic) int price_level;
@property (copy, nonatomic) NSString<Optional>* phone;
@property (copy, nonatomic) NSString<Optional>* region_id;
@property (copy, nonatomic) NSString<Optional>* address_line_1;
//@property (strong, nonatomic) NSString<Optional>* address_line_2;
@property (copy, nonatomic) NSString<Optional>* city;
@property (copy, nonatomic) NSString<Optional>* province;
@property (copy, nonatomic) NSString<Optional>* postal_code;
@property (assign, nonatomic) double latitude;
@property (assign, nonatomic) double longitude;
@property (copy, nonatomic) NSString* description;
@property (copy, nonatomic) NSString<Optional>* operating_hours;
@property (copy, nonatomic) NSString<Optional>* custom_confirmation_comments;
@property (copy, nonatomic) NSString<Optional>* notice;
@property (copy, nonatomic) NSString<Optional>* menu_url;
@property (assign, nonatomic) int reservation_notice_duration;
@property (copy, nonatomic) NSString<Optional>* deal;
@property (copy, nonatomic) NSString<Optional>* establishment_type;
@property (copy, nonatomic) NSString<Optional>* attire;
@property (strong, nonatomic) NSArray<NSString*><Optional>* good_for;
@property (strong, nonatomic) NSArray<NSString*><Optional>* payments;
@property (strong, nonatomic) NSArray<NSString*><Optional>* labels;
@property (assign, nonatomic) BOOL valet;
@property (assign, nonatomic) BOOL alcohol;
@property (assign, nonatomic) BOOL outdoor_seating;
@property (assign, nonatomic) BOOL smoking;
@property (copy, nonatomic) NSString<Optional>* relationship_type;
@property (copy, nonatomic) NSString<Optional>* external_ratings_url;
@property (strong, nonatomic) NSArray<ReviewModel>* reviews;
@property (strong, nonatomic) RatingModel<Optional>* rating;
@property (assign, nonatomic) BOOL isLoadingItem;

- (id)initLoadingItem;

@end
