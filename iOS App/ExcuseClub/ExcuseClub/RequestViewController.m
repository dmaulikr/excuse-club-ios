//
//  RequestViewController.m
//  ExcuseClub
//
//  Created by Marian Goia on 10/09/16.
//  Copyright © 2016 Marian Goia. All rights reserved.
//

#import "RequestViewController.h"

@interface RequestViewController ()

@property (weak, nonatomic) IBOutlet UILabel *middleLable;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;

@end

@implementation RequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.profileImageView.layer setCornerRadius:self.profileImageView.frame.size.width / 2];
    [self.profileImageView.layer setMasksToBounds:YES];

    [self setupViewControllerWithUser:@"Deadpool" andDay:@"Thursday" andTime:@"9:30PM"];
}

- (void)setupViewControllerWithUser:(NSString *)name andDay:(NSString *)whateverDay andTime:(NSString *)whateverTime {
    
    [_middleLable setText:[NSString stringWithFormat:@"Hey!\nYour buddy %@\nneeds an excuse for %@\nat %@", name, whateverDay, whateverTime]];
}

- (IBAction)nahButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
