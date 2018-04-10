//
//  ReadMoreSection.h
//  Eat
//
//  Created by Haris Muharemovic on 09/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NotesSectionProtocol

- (void)didExpandCollapseNote;

@end

@interface NotesSection : UIView

@property (weak, nonatomic) IBOutlet UILabel *note;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *noteViewHeight;
@property (weak, nonatomic) IBOutlet UIButton *readMoreBtn;
@property (weak, nonatomic) id<NotesSectionProtocol> delegate;

- (void)setUpNotesView:(NSString*)note;

@end
