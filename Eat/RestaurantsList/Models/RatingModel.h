//
//  RatingModel.h
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface RatingModel : JSONModel

@property (assign, nonatomic) double average_rating;
@property (strong, nonatomic) NSString* average_rating_image_url;
@property (assign, nonatomic) int number_of_ratings;

@end
