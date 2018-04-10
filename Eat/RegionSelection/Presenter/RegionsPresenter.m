//
//  RegionsPresenter.m
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RegionsPresenter.h"
#import "RegionsInteractor.h"

@implementation RegionsPresenter {
    
    RegionsInteractor *regionsInteractor;

}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        regionsInteractor = [[RegionsInteractor alloc] init];
    }
    return self;
}

- (void)getRegions {
    
    [regionsInteractor getRegions:^(NSArray *regions) {
        [self.delegate didGetRegions:regions];
    }];
}

- (void)getCuisines {
    
    [regionsInteractor getCuisines:^(id responseObject) {
        [self.delegate didGetCuisines:responseObject];
    }];
}

- (void)getNeigbourhoods {
    
    [regionsInteractor getNeigbourhoods:^(id responseObject) {
        [self.delegate didGetNeigbourhoods:responseObject];
    }];
}

@end
