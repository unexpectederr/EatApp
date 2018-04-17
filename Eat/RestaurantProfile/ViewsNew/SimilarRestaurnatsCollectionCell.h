//
//  SimilarRestaurnatsCollectionCell.h
//  Eat
//
//  Created by Haris Muharemovic on 16/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimilarRestaurnatsCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *sectionName;
@property (weak, nonatomic) IBOutlet UICollectionView *restaurantsCollectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;

- (void)buildCell:(NSArray*)restaurants sectionName:(NSString*)name;

@end
