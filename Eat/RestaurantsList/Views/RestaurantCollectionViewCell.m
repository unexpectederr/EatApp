//
//  RestaurantCollectionViewCell.m
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RestaurantCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "NSString+Repeat.h"
#import "UIHelper.h"

@implementation RestaurantCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)buildCell:(RestaurantModel*)restaurant {
    
    self.restaurantName.text = restaurant.name;
    self.restaurnatAddress.text = [restaurant.address_line_1 uppercaseString];
    
    self.cuisineName.layer.cornerRadius = 2.0f;
    self.cuisineName.layer.masksToBounds = YES;
    self.cuisineName.layer.borderWidth = 1.0f;
    self.cuisineName.layer.borderColor = [UIColor colorWithCGColor:[UIHelper colorFromHexString:@"#E3E2E4"].CGColor].CGColor;
    
    self.cuisineName.text = [NSString stringWithFormat:@"  %@  ", restaurant.cuisine_name];
    
    self.priceLevel.layer.cornerRadius = 2.0f;
    self.priceLevel.layer.masksToBounds = YES;
    self.priceLevel.layer.borderWidth = 1.0f;
    self.priceLevel.layer.borderColor = [UIColor colorWithCGColor:[UIHelper colorFromHexString:@"#E3E2E4"].CGColor].CGColor;
    
    self.priceLevel.text =  [NSString stringWithFormat:@"  %@  ", [@"$" repeatTimes:restaurant.price_level]];
    
    self.cuisineName.layer.cornerRadius = 2.0f;
    self.cuisineName.layer.masksToBounds = YES;
    
    if (restaurant.deal) {
        self.deals.hidden = NO;
        self.deals.layer.cornerRadius = 3.0f;
        self.deals.layer.masksToBounds = YES;
    }
    
    self.tripAdvisorRating.text = [NSString stringWithFormat:@"%.1f - %d Reviews", restaurant.rating.average_rating, restaurant.rating.number_of_ratings];
    
    [self.restaurantImage sd_setImageWithURL:[NSURL URLWithString:restaurant.image_url] placeholderImage:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self.restaurantImage.alpha = 0;
        [UIView animateWithDuration:1.0f animations:^(void) {
            self.restaurantImage.alpha = 1;
        }];
    }];
}

@end
