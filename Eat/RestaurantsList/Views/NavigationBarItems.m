//
//  NavigationItem.m
//  Eat
//
//  Created by Haris Muharemovic on 09/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "NavigationBarItems.h"

@implementation NavigationBarItems

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self initView];
    }
    return self;
}

-(void)initView {
    
    UIView *view = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"NavigationBarItems" owner:self options:nil] firstObject];
    [self addSubview:view];
    view.frame = self.bounds;
    
    self.layer.cornerRadius = 20.0f;
    self.layer.masksToBounds = YES;
    
}
- (IBAction)mainViewSwitch:(id)sender {
    [self.delegate didSwitchMainView];
}

- (IBAction)filtersBtnClicked:(id)sender {
    [self.delegate didClickFiltersBtn];
}

@end
