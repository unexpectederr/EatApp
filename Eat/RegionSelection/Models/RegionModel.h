//
//  RegionModel.h
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface RegionModel : JSONModel

@property (copy, nonatomic) NSString* id;
@property (copy, nonatomic) NSString* key;
@property (copy, nonatomic) NSString* name;
@property (copy, nonatomic) NSString* country_code;
@property (copy, nonatomic) NSString* image_url;

@end
