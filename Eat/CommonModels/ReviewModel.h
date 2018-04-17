//
//  ReviewModel.h
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ReviewModel : JSONModel

@property (assign, nonatomic) int rating;
@property (copy, nonatomic) NSString* published_date;
@property (copy, nonatomic) NSString* rating_image_url;
@property (copy, nonatomic) NSString* url;
@property (copy, nonatomic) NSString* text;
@property (copy, nonatomic) NSString* title;

@end
