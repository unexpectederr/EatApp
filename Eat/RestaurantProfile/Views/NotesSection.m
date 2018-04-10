//
//  ReadMoreSection.m
//  Eat
//
//  Created by Haris Muharemovic on 09/04/2018.
//  Copyright © 2018 Haris Muharemovic. All rights reserved.
//

#import "NotesSection.h"
#import "UIHelper.h"

@implementation NotesSection {
    BOOL isExpanded;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self initView];
    }
    return self;
}

-(void)initView {
    
    UIView *view = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"NotesSection" owner:self options:nil] firstObject];
    [self addSubview:view];
    view.frame = self.bounds;
    
    self.note.superview.layer.borderWidth = 1.0f;
    self.note.superview.layer.borderColor = [UIColor colorWithCGColor:[UIHelper colorFromHexString:@"#e8e8e8"].CGColor].CGColor;
    self.note.superview.layer.cornerRadius = 3.0f;
    self.note.superview.layer.masksToBounds = YES;
    
}

- (void)setUpNotesView:(NSString*)note {
    self.note.text = note;
    [self.note layoutIfNeeded];
    /*
     setting up notes view height constraint based on note label height
     */
    self.noteViewHeight.constant = self.note.bounds.size.height + 50;
    
}

- (IBAction)readMoreBtn:(id)sender {
    if(isExpanded) {
        self.note.numberOfLines = 4;
         [self.readMoreBtn setTitle:@"READ MORE" forState:UIControlStateNormal];
    } else {
        self.note.numberOfLines = 0;
         [self.readMoreBtn setTitle:@"READ LESS" forState:UIControlStateNormal];
    }
    [self.note layoutIfNeeded];
    isExpanded = !isExpanded;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.1f * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        self.noteViewHeight.constant = self.note.bounds.size.height + 50;
        [self.delegate didExpandCollapseNote];
    });

}

@end
