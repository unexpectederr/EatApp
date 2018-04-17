//
//  TripAdvisorRevCollectionViewCell.m
//  Eat
//
//  Created by Haris Muharemovic on 10/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "TripAdvisorRevCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIHelper.h"

@implementation TripAdvisorRevCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    _widthConstraint.constant = UIScreen.mainScreen.bounds.size.width - 20;
   
    self.layer.cornerRadius = 2.0f;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [UIColor colorWithCGColor:[UIHelper colorFromHexString:@"#ededed"].CGColor].CGColor;
}

- (void)setUpCell:(ReviewModel*)review {
    self.reviewTitle.text = [NSString stringWithFormat:@"'%@'", review.title];
    self.reviewText.text = review.text;
    self.reviewPublishedTime.text = review.published_date;
    [self.reviewRating sd_setImageWithURL:[NSURL URLWithString:review.rating_image_url]];
}

- (IBAction)readMoreOnTripAdvisorBtn:(id)sender {
    
}

@end
