//
//  RegionCollectionViewCell.h
//  Eat
//
//  Created by Haris Muharemovic on 08/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegionModel.h"

@interface RegionCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *regionName;
@property (weak, nonatomic) IBOutlet UIImageView *regionImage;

- (void)buildCell:(RegionModel*)region;

@end
