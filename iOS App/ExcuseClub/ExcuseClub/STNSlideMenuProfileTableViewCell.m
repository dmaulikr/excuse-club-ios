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
    
    [self.profileImageView setBackgroundColor:[UIColor redColor]];
    
    [self.nameLabel setTextColor:[UIColor whiteColor]];
}

@end
