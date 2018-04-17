//
//  RestaurantDetailViewController.h
//  Eat
//
//  Created by Haris Muharemovic on 17/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestaurantModel.h"

@interface RestaurantDetailViewController : UIViewController

@property (strong, nonatomic) RestaurantModel *restaurant;
@property (weak, nonatomic) IBOutlet UITableView *detailsTableView;

@end
