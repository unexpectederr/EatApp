//
//  RestaurantSmallCollectionViewCell.m
//  Eat
//
//  Created by Haris Muharemovic on 10/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RestaurantSmallCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation RestaurantSmallCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)buildCell:(RestaurantModel*)restaurant {
    
    self.restaurantName.text = restaurant.name;
    self.cuisineName.text = restaurant.cuisine_name;
    
    [self.restaurantImage sd_setImageWithURL:[NSURL URLWithString:restaurant.image_url] placeholderImage:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self.restaurantImage.alpha = 0;
        [UIView animateWithDuration:1.0f animations:^(void) {
            self.restaurantImage.alpha = 1;
        }];
    }];
    
    CAShapeLayer * maskLayer = [CAShapeLayer layer];
    maskLayer.path = [UIBezierPath bezierPathWithRoundedRect: self.bounds byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: (CGSize){2.0, 2.0}].CGPath;
    
    self.restaurantImage.layer.mask = maskLayer;
    
    self.tripAdvisorRating.text = [NSString stringWithFormat:@"%d Reviews", restaurant.rating.number_of_ratings];
    
    self.layer.cornerRadius = 2.0f;
    self.layer.masksToBounds = YES;
    
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 2.0f);
    self.layer.shadowRadius = 2.0f;
    self.layer.shadowOpacity = 0.15f;
    self.layer.masksToBounds = NO;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.contentView.layer.cornerRadius].CGPath;
    
}

@end
