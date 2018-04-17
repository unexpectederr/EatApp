//
//  RestaurantsListViewController.h
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationBarItems.h"

@interface RestaurantsListViewController : UIViewController

@property (strong, nonatomic) NSString *regionCode;
@property (weak, nonatomic) IBOutlet UICollectionView *restaurantsCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *emptyListMessage;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;

@end
