//
//  MarkerInfoView.m
//  Eat
//
//  Created by Haris Muharemovic on 09/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "MarkerInfoView.h"

@implementation MarkerInfoView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    
    UIView *view = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"MarkerInfoView" owner:self options:nil] firstObject];
    [self addSubview:view];
    view.frame = self.bounds;
    
    view.layer.cornerRadius = 3.0f;
    view.layer.masksToBounds = YES;
}

@end
