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

@property (strong, nonatomic) NSString* id;
@property (strong, nonatomic) NSString* key;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* country_code;
@property (strong, nonatomic) NSString* image_url;
@property (strong, nonatomic) NSArray<NSString*>* image_urls;
@property (strong, nonatomic) NSString<Optional>* cuisine_id;
@property (strong, nonatomic) NSString<Optional>* cuisine_name;
@property (strong, nonatomic) NSString<Optional>* neighborhood_id;
@property (strong, nonatomic) NSString<Optional>* neighborhood_name;
@property (assign, nonatomic) int price_level;
@property (strong, nonatomic) NSString<Optional>* phone;
@property (strong, nonatomic) NSString<Optional>* region_id;
@property (strong, nonatomic) NSString<Optional>* address_line_1;
//@property (strong, nonatomic) NSString<Optional>* address_line_2;
@property (strong, nonatomic) NSString<Optional>* city;
@property (strong, nonatomic) NSString<Optional>* province;
@property (strong, nonatomic) NSString<Optional>* postal_code;
@property (assign, nonatomic) double latitude;
@property (assign, nonatomic) double longitude;
@property (strong, nonatomic) NSString* description;
@property (strong, nonatomic) NSString* operating_hours;
@property (strong, nonatomic) NSString<Optional>* custom_confirmation_comments;
@property (strong, nonatomic) NSString<Optional>* notice;
@property (strong, nonatomic) NSString<Optional>* menu_url;
@property (assign, nonatomic) int reservation_notice_duration;
@property (strong, nonatomic) NSString<Optional>* deal;
@property (strong, nonatomic) NSString<Optional>* establishment_type;
@property (strong, nonatomic) NSString<Optional>* attire;
@property (strong, nonatomic) NSArray<NSString*><Optional>* good_for;
@property (strong, nonatomic) NSArray<NSString*><Optional>* payments;
@property (strong, nonatomic) NSArray<NSString*><Optional>* labels;
@property (assign, nonatomic) BOOL valet;
@property (assign, nonatomic) BOOL alcohol;
@property (assign, nonatomic) BOOL outdoor_seating;
@property (assign, nonatomic) BOOL smoking;
@property (strong, nonatomic) NSString<Optional>* relationship_type;
@property (strong, nonatomic) NSString<Optional>* external_ratings_url;
@property (strong, nonatomic) NSArray<ReviewModel>* reviews;
@property (strong, nonatomic) RatingModel<Optional>* rating;

@end
