//
//  MainViewController.m
//  ExcuseClub
//
//  Created by Marian Goia on 10/09/16.
//  Copyright © 2016 Marian Goia. All rights reserved.
//

#import "MainViewController.h"
#import <FontAwesome/NSString+FontAwesome.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (NSString *)segueIdentifierForIndexPathInRightMenu:(NSIndexPath *)indexPath
{
    NSString *identifier = @"";
    switch (indexPath.row) {
        case 0:
            identifier = @"profile";
            break;
        case 1:
            identifier = @"firstRow";
            break;
        case 2:
            identifier = @"secondRow";
            break;
    }
    
    return identifier;
}

- (AMPrimaryMenu)primaryMenu {
    return AMPrimaryMenuRight;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)configureRightMenuButton:(UIButton *)button {
    CGRect frame = button.frame;
    frame = CGRectMake(0, 0, 50, 50);
    button.frame = frame;
    button.backgroundColor = [UIColor clearColor];
    
//    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//    [button.titleLabel setFont:[UIFont fontWithName:kFontAwesomeFamilyName size:17.f]];
//    [button setTitle:[NSString fontAwesomeIconStringForEnum:FABars] forState:UIControlStateNormal];
//    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button.titleLabel setFont:[UIFont fontWithName:@"Zapfino" size:50]];
    [button setTitle:@"=" forState:UIControlStateNormal];
    
//    [button setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];

}

- (void)configureSlideLayer:(CALayer *)layer {
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOpacity = 1;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowRadius = 5;
    layer.masksToBounds = NO;
    layer.shadowPath =[UIBezierPath bezierPathWithRect:self.view.layer.bounds].CGPath;
}

- (UIViewAnimationOptions) openAnimationCurve {
    return UIViewAnimationOptionCurveEaseOut;
}

- (UIViewAnimationOptions) closeAnimationCurve {
    return UIViewAnimationOptionCurveEaseOut;
}

@end
