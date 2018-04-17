//
//  ImagePagerCollectionCell.m
//  Eat
//
//  Created by Haris Muharemovic on 16/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "ImagePagerCollectionCell.h"
#import "ImageItemCollectionViewCell.h"

@implementation ImagePagerCollectionCell {
    NSMutableArray *imageUrls;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    _widthConstraint.constant = UIScreen.mainScreen.bounds.size.width;
}

- (void)buildCell:(RestaurantModel*)restaurant {
    
    [_collectionView registerNib:[UINib nibWithNibName:@"ImageItemCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"imageItemCollectionViewCell"];
    
    _pageControl.numberOfPages = restaurant.image_urls.count;
   
    imageUrls = [[NSMutableArray alloc] init];
    
    if (![restaurant.image_urls containsObject:restaurant.image_url])
        [imageUrls addObject:restaurant.image_url];
    
    [imageUrls addObjectsFromArray:restaurant.image_urls];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger currentIndex = self.collectionView.contentOffset.x / self.collectionView.frame.size.width;
    _pageControl.currentPage = currentIndex;
}

#pragma <CollectionViewDataSource>

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return imageUrls.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageItemCollectionViewCell" forIndexPath:indexPath];
    NSString *imageUrl = imageUrls[indexPath.row];
    [cell buildCell:imageUrl];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.contentView.bounds.size.width, self.collectionView.bounds.size.height);
}

@end
