//
//  ImagesPagerViewController.m
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "ImagesPagerViewController.h"
#import "ImageViewController.h"

@interface ImagesPagerViewController ()

@end

@implementation ImagesPagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ImageViewController *viewController = (ImageViewController*)[self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:viewController];
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:nil completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UIViewController *) viewControllerAtIndex:(NSUInteger)index {
    
    ImageViewController *viewController = (ImageViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"ImageViewController"];
    viewController.imageUrl = self.imageUrls[index];
    viewController.pageIndex = index;
    return viewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = ((ImageViewController*) viewController).pageIndex;
    if (index == 0 || index == NSNotFound)
        return nil;
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = ((ImageViewController*) viewController).pageIndex;
    if (index == NSNotFound)
        return nil;
    index++;
    if (index == self.imageUrls.count)
        return nil;
    return [self viewControllerAtIndex:index];
}

-(void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    if (!completed) {
        return;
    } else {
        [self.dellegate didSwipe:((ImageViewController*) pageViewController.viewControllers.firstObject).pageIndex];
    }
}
         
@end
