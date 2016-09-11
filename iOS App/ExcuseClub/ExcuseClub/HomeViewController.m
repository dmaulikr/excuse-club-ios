//
//  HomeViewController.m
//  ExcuseClub
//
//  Created by Marian Goia on 10/09/16.
//  Copyright © 2016 Marian Goia. All rights reserved.
//

#import "HomeViewController.h"
@import MapKit;
#import "BuddyTableViewCell.h"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *locationManager;

@property (nonatomic, strong) NSArray *buddiesArray;
@property (nonatomic, strong) NSArray *imagesArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.translucent = NO;
    
    _buddiesArray = @[@"Spider Man", @"Bob Agent", @"Unicorn"];
    _imagesArray = @[];
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.tableView setBackgroundView:nil];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([BuddyTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"BuddyCell"];
    
    self.mapView.showsUserLocation = YES;
    self.mapView.delegate = self;
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)
    {
        if([[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationAlwaysUsageDescription"] && [self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]){
            [self.locationManager requestAlwaysAuthorization];
        }
    }
    
    [self.locationManager startUpdatingLocation];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (IBAction)segmentedValueChanged:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        [self.mapView setHidden:YES];
        [self.tableView setHidden:NO];
    } else {
        [self.mapView setHidden:NO];
        [self.tableView setHidden:YES];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return [self.buddiesArray count];
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 82.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BuddyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BuddyCell"];
    
    if (!cell) {
        cell = [[BuddyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BuddyCell"];
        
        [cell setupWithName:[self.buddiesArray objectAtIndex:indexPath.row] andPicture:[self.buddiesArray objectAtIndex:indexPath.row]];
    } else {
        [cell setupWithName:[self.buddiesArray objectAtIndex:indexPath.row] andPicture:[self.buddiesArray objectAtIndex:indexPath.row]];
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Buddies";
    }
    
    return @"";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    // Background color
    view.tintColor = [UIColor colorWithRed:0.17 green:0.20 blue:0.24 alpha:1.00];
    
    // Text Color
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    [header.textLabel setTextColor:[UIColor whiteColor]];
}

- (void)mapView:(MKMapView *)aMapView didUpdateUserLocation:(MKUserLocation *)aUserLocation {
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    CLLocationCoordinate2D location;
    location.latitude = aUserLocation.coordinate.latitude;
    location.longitude = aUserLocation.coordinate.longitude;
    region.span = span;
    region.center = location;
    [aMapView setRegion:region animated:YES];
}

@end
