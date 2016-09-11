//
//  STNSlideMenuTableViewCell.m
//  SafeToNet
//
//  Created by Marian Goia on 29/04/16.
//  Copyright © 2016 Marian Goia. All rights reserved.
//

#import "STNSlideMenuTableViewCell.h"

#import <FontAwesome/NSString+FontAwesome.h>

@interface STNSlideMenuTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *customAccessoryView;

@end

@implementation STNSlideMenuTableViewCell

- (void)awakeFromNib {
    [self setBackgroundColor:[UIColor clearColor]];

    [self.titleLabel setTextColor:[UIColor whiteColor]];
    
    [self.customAccessoryView setTextColor:[UIColor whiteColor]];
    [self.customAccessoryView setFont:[UIFont fontWithName:kFontAwesomeFamilyName size:30.f]];
    [self.customAccessoryView setText:[NSString fontAwesomeIconStringForEnum:FAAngleRight]];
}

@end
