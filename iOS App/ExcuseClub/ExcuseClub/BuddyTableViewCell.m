//
//  BuddyTableViewCell.m
//  ExcuseClub
//
//  Created by Marian Goia on 10/09/16.
//  Copyright © 2016 Marian Goia. All rights reserved.
//

#import "BuddyTableViewCell.h"

@interface BuddyTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLable;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageVie;

- (IBAction)selectButtonPressed:(UIButton *)sender;

@end

@implementation BuddyTableViewCell

#pragma mark - Public

- (void)setupWithName:(NSString *)name andPicture:(NSString *)imageName {
    [self.nameLabel setText:name];
    
    [self.profileImageVie setImage:[UIImage imageNamed:name]];
}

#pragma mark - Private

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setBackgroundColor:[UIColor clearColor]];
    [self.contentView setBackgroundColor:[UIColor clearColor]];
    
    [self.profileImageVie.layer setMasksToBounds:YES];
    self.profileImageVie.layer.cornerRadius = self.profileImageVie.frame.size.width/2;
}

- (void)selectButtonPressed:(UIButton *)sender {
    [sender setSelected:YES];
    
    [sender setTitle:@"Selected" forState:UIControlStateSelected];
    [sender setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
}

@end
