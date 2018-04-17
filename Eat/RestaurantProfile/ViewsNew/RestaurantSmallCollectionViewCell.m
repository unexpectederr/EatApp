//
//  RestaurantSmallCollectionViewCell.m
//  Eat
//
//  Created by Haris Muharemovic on 10/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "RestaurantSmallCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "ImageLoadingManager.h"

@implementation RestaurantSmallCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)buildCell:(RestaurantModel*)restaurant {
    
    self.restaurantName.text = restaurant.name;
    self.cuisineName.text = restaurant.cuisine_name;
    
    [[ImageLoadingManager sharedInstance] loadImage:restaurant.image_url withImageWidth:(int)self.restaurantImage.bounds.size.width withImageHeight:(int)self.restaurantImage.bounds.size.height complete:^(UIImage *image) {
        self.restaurantImage.image = image;
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
