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
    
    __weak typeof(self) welf = self;

    [regionsInteractor getRegions:^(NSArray *regions) {
        [welf.delegate showRegionsList:regions];
    }];
}

- (void)getCuisines {
    
    __weak typeof(self) welf = self;

    [regionsInteractor getCuisines:^(id responseObject) {
        [welf.delegate didGetCuisines:responseObject];
    }];
}

- (void)getNeigbourhoods {
    
    __weak typeof(self) welf = self;

    [regionsInteractor getNeigbourhoods:^(id responseObject) {
        [welf.delegate didGetNeigbourhoods:responseObject];
    }];
}

@end
