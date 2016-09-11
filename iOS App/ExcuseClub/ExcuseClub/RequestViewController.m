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

- (IBAction)gotchaButtonPressed:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Imagine this is a facebook check-in prompt" message:@"I fell asleep on the floor and didn't do it" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Share" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
