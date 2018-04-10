//
//  ImageViewController.m
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "ImageViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.restaurantImage sd_setImageWithURL:[NSURL URLWithString:self.imageUrl] placeholderImage:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
