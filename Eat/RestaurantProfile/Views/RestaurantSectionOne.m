//
//  RestaurnatSectionOne.m
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RestaurantSectionOne.h"
#import "UIHelper.h"

@implementation RestaurantSectionOne

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self initView];
    }
    return self;
}

-(void)initView {
    
    UIView *view = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"RestaurantSectionOne" owner:self options:nil] firstObject];
    [self addSubview:view];
    view.frame = self.bounds;

    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [UIColor colorWithCGColor:[UIHelper colorFromHexString:@"#e8e8e8"].CGColor].CGColor;
    self.layer.cornerRadius = 3.0f;
    self.layer.masksToBounds = YES;
    
}

- (void)setUpRestaurantSectionOne:(RestaurantModel*)restaurant {
    [self.tripAdvisorRating setTitle:[NSString stringWithFormat:@"%d TripAdvisor Reviews", restaurant.rating.number_of_ratings] forState:UIControlStateNormal];
    self.address.text = restaurant.address_line_1;
}

- (IBAction)tripAdvisorBtnClicked:(id)sender {
    [self.delegate didOpenTripAdvisorReviews];
}

@end
