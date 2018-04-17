//
//  ImageLoadingManager.h
//  Eat
//
//  Created by Haris Muharemovic on 15/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageLoadingManager : NSObject

+ (ImageLoadingManager *)sharedInstance;

- (void)loadImage:(NSString *)imageUrl withImageWidth:(int)width withImageHeight:(int)height complete:(void (^)(UIImage *image))complete;
- (void)cancelImageLoad:(NSString*)imageUrl;

@end
