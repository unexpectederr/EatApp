//
//  ImageViewController.m
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "ImageViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "ImageLoadingManager.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[ImageLoadingManager sharedInstance] loadImage:self.imageUrl withImageWidth:(int)self.restaurantImage.bounds.size.width withImageHeight:(int)self.restaurantImage.bounds.size.height complete:^(UIImage *image) {
        self.restaurantImage.image = image;
        self.restaurantImage.alpha = 0;
        [UIView animateWithDuration:1.0f animations:^(void) {
            self.restaurantImage.alpha = 1;
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
