//
//  TripAdvisorReviewsViewController.m
//  Eat
//
//  Created by Haris Muharemovic on 10/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "TripAdvisorReviewsViewController.h"
#import "TripAdvisorRevCollectionViewCell.h"
#import "UIHelper.h"

@interface TripAdvisorReviewsViewController ()

@end

@implementation TripAdvisorReviewsViewController

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationItem.title = @"TripAdvisor Reviews";
    self.navigationItem.backBarButtonItem.title = @"";
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.reviewsCollectionView registerNib:[UINib nibWithNibName:@"TripAdvisorRevCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"tripAdvisorRevCollectionViewCell"];
    
     self.reviewsCollectionView.backgroundColor = [UIColor colorWithCGColor:[UIHelper colorFromHexString:@"#F9FAFC"].CGColor];
    
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout*)_reviewsCollectionView.collectionViewLayout;
    flowLayout.estimatedItemSize = CGSizeMake(1, 1);
    
    self.numberOfReviews.text = [NSString stringWithFormat:@"%i reviews", (int)_reviews.count];
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _reviews.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TripAdvisorRevCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"tripAdvisorRevCollectionViewCell" forIndexPath:indexPath];
    
    [cell setUpCell:(ReviewModel*)_reviews[indexPath.row]];
    
    return cell;
}

@end
