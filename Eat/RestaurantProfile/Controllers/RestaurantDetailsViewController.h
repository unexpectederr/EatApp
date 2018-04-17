//
//  RestaurantDetailsViewController.h
//  Eat
//
//  Created by Haris Muharemovic on 16/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestaurantModel.h"

@interface RestaurantDetailsViewController : UIViewController

@property (strong, nonatomic) RestaurantModel *restaurant;
@property (weak, nonatomic) IBOutlet UICollectionView *detailsCollectionView;

@end