//
//  RestaurantSectionTwo.m
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RestaurantSectionTwo.h"
#import "NSString+Repeat.h"
#import "UIHelper.h"

@implementation RestaurantSectionTwo

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self initView];
    }
    return self;
}

-(void)initView {
    
    UIView *view = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"RestaurantSectionTwo" owner:self options:nil] firstObject];
    [self addSubview:view];
    view.frame = self.bounds;
    
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [UIColor colorWithCGColor:[UIHelper colorFromHexString:@"#e8e8e8"].CGColor].CGColor;
    self.layer.cornerRadius = 3.0f;
    self.layer.masksToBounds = YES;
    
}

- (void)setUpRestaurantSectionTwo:(RestaurantModel*)restaurant {
    self.priceLevel.text = [@"$" repeatTimes:restaurant.price_level];
    self.establishmentType.text = restaurant.establishment_type;
    self.attire.text = restaurant.attire;
}

@end
