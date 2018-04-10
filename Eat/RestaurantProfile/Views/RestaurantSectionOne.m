//
//  RestaurnatSectionOne.m
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RestaurnatSectionOne.h"

@implementation RestaurantSectionOne

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        //[self initView:[self tag]];
    }
    return self;
}

-(void)initView:(long)tag {
    
    UIView *view = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"RestaurnatSectionOne" owner:self options:nil] firstObject];
    [self addSubview:view];
    view.frame = self.bounds;

//    self.shape.layer.borderWidth = 2.0f;
//    self.shape.layer.borderColor = [UIColor colorWithCGColor:[self colorFromHexString:@"#E3E2E4"].CGColor].CGColor;
//    self.shape.backgroundColor = [self colorFromHexString:@"#FFF2E8"];
    
}

@end
