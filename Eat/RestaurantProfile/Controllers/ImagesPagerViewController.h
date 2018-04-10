//
//  ImagesPagerViewController.h
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ImagesPagerViewControllerDelegate

- (void)didSwipe:(NSInteger)selectedIndex;

@end

@interface ImagesPagerViewController : UIPageViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic, strong) NSArray<NSString*> *imageUrls;
@property (nonatomic, weak) id<ImagesPagerViewControllerDelegate> dellegate;

@end
