//
//  RegionsPresenter.h
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RegionsPresenterProtocol

- (void)showRegionsList:(NSArray*)regions;
- (void)didGetCuisines:(id)response;
- (void)didGetNeigbourhoods:(id)response;

@end

@interface RegionsPresenter : NSObject

@property (weak, nonatomic) id<RegionsPresenterProtocol> delegate;

- (void)getRegions;
- (void)getCuisines;
- (void)getNeigbourhoods;

@end
