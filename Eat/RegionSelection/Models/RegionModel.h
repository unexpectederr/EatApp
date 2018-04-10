//
//  RegionModel.h
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface RegionModel : JSONModel

@property (strong, nonatomic) NSString* id;
@property (strong, nonatomic) NSString* key;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* country_code;
@property (strong, nonatomic) NSString* image_url;

@end
