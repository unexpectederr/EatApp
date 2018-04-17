//
//  GenericSectionItemCollectionViewCell.h
//  Eat
//
//  Created by Haris Muharemovic on 16/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GenericSectionItemModel.h"

@interface GenericSectionItemCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *arrow;

- (void)buildCell:(GenericSectionItemModel*)item;

@end
