//
//  STNSlideMenuProfileTableViewCell.m
//  SafeToNet
//
//  Created by Marian Goia on 29/04/16.
//  Copyright © 2016 Marian Goia. All rights reserved.
//

#import "STNSlideMenuProfileTableViewCell.h"

@implementation STNSlideMenuProfileTableViewCell

- (void)awakeFromNib {
    [self setBackgroundColor:[UIColor clearColor]];
    
    [self.profileImageView.layer setCornerRadius:self.profileImageView.frame.size.width / 2];
    [self.profileImageView.layer setMasksToBounds:YES];
    
    [self.profileImageView setBackgroundColor:[UIColor colorWithRed:0.17 green:0.20 blue:0.24 alpha:1.00]];
    
    [self.nameLabel setTextColor:[UIColor whiteColor]];
}

@end
