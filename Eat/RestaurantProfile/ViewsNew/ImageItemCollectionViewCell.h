//
//  ImageItemCollectionViewCell.h
//  Eat
//
//  Created by Haris Muharemovic on 16/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageItemCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;

- (void)buildCell:(NSString*)imageUrl;

@end
