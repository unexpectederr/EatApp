//
//  CuisineModel.h
//  Eat
//
//  Created by Haris Muharemovic on 18/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CuisineModel : JSONModel

@property (copy, nonatomic) NSString* id;
@property (copy, nonatomic) NSString* name;

@end
