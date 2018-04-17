//
//  ImageLoadingManager.m
//  Eat
//
//  Created by Haris Muharemovic on 15/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "ImageLoadingManager.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation ImageLoadingManager {
    SDWebImageManager *_imageDownloader;
    NSMutableDictionary *_imageLoadingOperation;
}

+ (ImageLoadingManager *)sharedInstance {
    static ImageLoadingManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ImageLoadingManager alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _imageDownloader = [[SDWebImageManager alloc] init];
        _imageLoadingOperation = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)loadImage:(NSString *)imageUrl withImageWidth:(int)width withImageHeight:(int)height complete:(void (^)(UIImage *image))complete {
    
     NSString *url = [NSString stringWithFormat:@"%@/-/scale_crop/%dx%d/center/-/quality/lightest/-/format/jpeg/", imageUrl, width, height];
    
    __block BOOL addOperation = YES;
    
    id <SDWebImageOperation> operation = [[SDWebImageManager sharedManager] loadImageWithURL:[NSURL URLWithString:url] options:SDWebImageHighPriority progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        
        if (image) {
            [_imageLoadingOperation removeObjectForKey:imageUrl];
            NSLog(@"removed image %@", imageUrl);
            addOperation = (cacheType == SDImageCacheTypeMemory ? NO : YES);
            complete(image);
        }
    }];

    if (operation && ![_imageLoadingOperation objectForKey:imageUrl] && addOperation) {
        [_imageLoadingOperation setValue:operation forKey:imageUrl];
    }
}

- (void)cancelImageLoad:(NSString*)imageUrl{
    if ([_imageLoadingOperation objectForKey:imageUrl]) {
        id <SDWebImageOperation> operation = [_imageLoadingOperation objectForKey:imageUrl];
        [_imageLoadingOperation removeObjectForKey:imageUrl];
        [operation cancel];
    }
}

@end
