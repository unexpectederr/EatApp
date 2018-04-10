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
@property (strong, nonatomic) NSString* published_date;
@property (strong, nonatomic) NSString* rating_image_url;
@property (strong, nonatomic) NSString* url;
@property (strong, nonatomic) NSString* text;
@property (strong, nonatomic) NSString* title;
//@property (strong, nonatomic) NSString*"user": {
//    "username": "Anver Q",
//    "user_location": {
//        "name": "Swindon, United Kingdom",
//        "id": "187049"
//    }
//},
@end
