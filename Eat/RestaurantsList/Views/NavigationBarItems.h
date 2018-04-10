//
//  NavigationItem.h
//  Eat
//
//  Created by Haris Muharemovic on 09/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NavigationItemProtocol

- (void)didSwitchMainView;
- (void)didClickFiltersBtn;

@end

@interface NavigationBarItems : UIView

@property (weak, nonatomic) IBOutlet UIButton *mainViewSwitchButton;
@property (weak, nonatomic) id<NavigationItemProtocol> delegate;

@end
