//
//  ExcuseAPI.m
//  ExcuseClub
//
//  Created by pinglamb on 10/9/2016.
//  Copyright © 2016 Marian Goia. All rights reserved.
//

#import "ExcuseAPI.h"

@implementation ExcuseAPI

AFHTTPSessionManager *manager;
NSString *baseUrl;
NSString *secret;


+ (ExcuseAPI *)client {
    ExcuseAPI *client = [[ExcuseAPI alloc] initWithManager];
    return client;
}

- (ExcuseAPI *) initWithManager {
    manager = [AFHTTPSessionManager manager];
    baseUrl = @"http://excuse-club.herokuapp.com";
    secret = @"secret";
    return self;
}

- (void)registerUserWithName:(NSString *)name andPhone:(NSString *)phone {
    [manager POST:[self urlWithPath:@"/api/users.json"]
       parameters:[self parametersWithBody:@{@"name" : name, @"phone" : phone}]
         progress:nil
          success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (NSString *)urlWithPath:(NSString *)path {
    NSMutableString *url = [baseUrl mutableCopy];
    [url appendString:path];
    return url;
}

- (NSDictionary *)parametersWithBody:(NSDictionary *)body {
    NSMutableDictionary *params = [@{} mutableCopy];
    [params setObject:secret forKey:@"api_key"];
    [params addEntriesFromDictionary:body];
    return params;
}

@end