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
    
    ImageItemCollectionViewCell* __weak welf = self;

    [[ImageLoadingManager sharedInstance] loadImage:imageUrl withImageWidth:(int)self.bounds.size.width withImageHeight:(int)self.bounds.size.height complete:^(UIImage *image) {
        
        ImageItemCollectionViewCell* strongSelf = welf;
        if(!strongSelf) return;
        
        strongSelf.image.image = image;
    }];
}

@end
