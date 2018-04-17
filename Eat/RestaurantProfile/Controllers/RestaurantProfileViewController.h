//
//  RestaurantProfileViewController.h
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestaurantModel.h"

@interface RestaurantProfileViewController : UIViewController

@property (strong, nonatomic) RestaurantModel *restaurant;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *imagesPageControl;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headerTopConstraint;
@property (weak, nonatomic) IBOutlet UIStackView *stackview;
@property (weak, nonatomic) IBOutlet UIView *mainContainer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewContainerHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *restaurantInfoSectionHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *notesSectionHeight;

@end
