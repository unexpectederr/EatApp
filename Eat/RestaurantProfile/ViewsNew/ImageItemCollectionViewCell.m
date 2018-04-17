//
//  ImageItemCollectionViewCell.m
//  Eat
//
//  Created by Haris Muharemovic on 16/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "ImageItemCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "ImageLoadingManager.h"

@implementation ImageItemCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)buildCell:(NSString*)imageUrl {
    
    [[ImageLoadingManager sharedInstance] loadImage:imageUrl withImageWidth:(int)self.bounds.size.width withImageHeight:(int)self.bounds.size.height complete:^(UIImage *image) {
        self.image.image = image;
        self.image.alpha = 0;
        [UIView animateWithDuration:1.0f animations:^(void) {
            self.image.alpha = 1;
        }];
    }];
}

@end
