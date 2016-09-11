//
//  RightSlidingViewController.m
//  ExcuseClub
//
//  Created by Marian Goia on 10/09/16.
//  Copyright © 2016 Marian Goia. All rights reserved.
//

#import "RightSlidingViewController.h"
#import "STNSlideMenuProfileTableViewCell.h"
#import "STNSlideMenuTableViewCell.h"

@interface RightSlidingViewController ()

@property (nonatomic, strong) NSArray *dataSourceArray;

@end

@implementation RightSlidingViewController

- (void)viewDidLoad {
    [self setupDataSourceArray];

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([STNSlideMenuProfileTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([STNSlideMenuProfileTableViewCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([STNSlideMenuTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([STNSlideMenuTableViewCell class])];
    
    [self.view setBackgroundColor:[UIColor redColor]];
    [self.tableView setSeparatorColor:[UIColor whiteColor]];
}

- (void)setupDataSourceArray {
    self.dataSourceArray = @[@"Home", @"Edit My Profile", @"Achievements", @"Notification Settings", @"Sign Out"];
}

#pragma mark - UITableView delegate methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    
    if (indexPath.row == 0) {
        cell = (STNSlideMenuProfileTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([STNSlideMenuProfileTableViewCell class]) forIndexPath:indexPath];
        
        [((STNSlideMenuProfileTableViewCell *)cell).nameLabel setText:@"John Doe"];
    } else {
        cell = (STNSlideMenuTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([STNSlideMenuTableViewCell class]) forIndexPath:indexPath];
        
        ((STNSlideMenuTableViewCell *)cell).titleLabel.text = [self.dataSourceArray objectAtIndex:indexPath.row - 1];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSourceArray count] + 1; // All menu items plus the profile image view
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 78.f;
    }
    
    else return 44.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
