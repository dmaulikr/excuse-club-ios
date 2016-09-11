//
//  ExcuseAPI.h
//  ExcuseClub
//
//  Created by pinglamb on 10/9/2016.
//  Copyright © 2016 Marian Goia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking/AFNetworking.h"

@interface ExcuseAPI : NSObject

+ (ExcuseAPI *)client;

- (void)registerUserWithName:(NSString *)name andPhone:(NSString *)phone success:(void (^)(NSDictionary *user))success failure:(void (^)(NSString *error))failure;
- (void)getBuddies:(void (^)(NSArray *buddies))success failure:(void (^)(NSString *error))failure;
- (void)createBuddies:(NSArray *)buddies success:(void (^)(NSArray *buddies))success failure:(void (^)(NSString *error))failure;


@end
