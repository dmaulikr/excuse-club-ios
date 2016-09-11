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

- (void)registerUserWithName:(NSString *)name andPhone:(NSString *)phone success:(void (^)(NSDictionary *user))success failure:(void (^)(NSString *error))failure {
    [manager POST:[self urlWithPath:@"/api/users.json"]
       parameters:[self parametersWithBody:@{@"name" : name, @"phone" : phone}]
         progress:nil
          success:^(NSURLSessionTask *task, id responseObject) {
              NSLog(@"JSON: %@", responseObject);
              if ([responseObject objectForKey:@"error"]) {
                  if(failure) {
                      failure([responseObject objectForKey:@"error"]);
                  }
              } else {
                  if(success) {
                      success([responseObject objectForKey:@"user"]);
                  }
              }
          } failure:^(NSURLSessionTask *operation, NSError *error) {
              NSLog(@"Error: %@", error);
              if(failure) {
                  failure([error localizedDescription]);
              }
          }];
}

- (void)createBuddies:(NSArray *)buddies success:(void (^)(NSArray *))success failure:(void (^)(NSString *))failure {
    [manager POST:[self urlWithPath:@"/api/buddies.json"]
       parameters:[self parametersWithBody:@{@"buddies" : buddies}]
         progress:nil
          success:^(NSURLSessionTask *task, id responseObject) {
           NSLog(@"JSON: %@", responseObject);
           if ([responseObject objectForKey:@"error"]) {
               if(failure) {
                   failure([responseObject objectForKey:@"error"]);
               }
           } else {
               if(success) {
                   success([responseObject objectForKey:@"buddies"]);
               }
           }
       } failure:^(NSURLSessionTask *operation, NSError *error) {
           NSLog(@"Error: %@", error);
           if(failure) {
               failure([error localizedDescription]);
           }
       }];
}

- (void)getBuddies:(void (^)(NSArray *))success failure:(void (^)(NSString *))failure
{
    [manager GET:[self urlWithPath:@"/api/buddies.json"]
       parameters:[self parametersWithBody:@{}]
         progress:nil
         success:^(NSURLSessionTask *task, id responseObject) {
             NSLog(@"JSON: %@", responseObject);
             if ([responseObject objectForKey:@"error"]) {
                 if(failure) {
                     failure([responseObject objectForKey:@"error"]);
                 }
             } else {
                 if(success) {
                     success([responseObject objectForKey:@"buddies"]);
                 }
             }
         } failure:^(NSURLSessionTask *operation, NSError *error) {
             NSLog(@"Error: %@", error);
             if(failure) {
                 failure([error localizedDescription]);
             }
         }];
}

- (void)createExcuseWithStart:(NSDate *)start andEnd:(NSDate *)end andBuddies:(NSArray *)buddies success:(void (^)(NSDictionary *))success failure:(void (^)(NSString *))failure {
    [manager POST:[self urlWithPath:@"/api/excuses.json"]
      parameters:[self parametersWithBody:@{
                                            @"start_time" : @([start timeIntervalSince1970]),
                                            @"end_time" : @([end timeIntervalSince1970]),
                                            @"buddies" : buddies
                                            }]
        progress:nil
         success:^(NSURLSessionTask *task, id responseObject) {
             NSLog(@"JSON: %@", responseObject);
             if ([responseObject objectForKey:@"error"]) {
                 if(failure) {
                     failure([responseObject objectForKey:@"error"]);
                 }
             } else {
                 if(success) {
                     success([responseObject objectForKey:@"excuse"]);
                 }
             }
         } failure:^(NSURLSessionTask *operation, NSError *error) {
             NSLog(@"Error: %@", error);
             if(failure) {
                 failure([error localizedDescription]);
             }
         }];
}

- (void)getBegs:(void (^)(NSArray *))success failure:(void (^)(NSString *))failure {
    [manager GET:[self urlWithPath:@"/api/begs.json"]
      parameters:[self parametersWithBody:@{}]
        progress:nil
         success:^(NSURLSessionTask *task, id responseObject) {
             NSLog(@"JSON: %@", responseObject);
             if ([responseObject objectForKey:@"error"]) {
                 if(failure) {
                     failure([responseObject objectForKey:@"error"]);
                 }
             } else {
                 if(success) {
                     success([responseObject objectForKey:@"begs"]);
                 }
             }
         } failure:^(NSURLSessionTask *operation, NSError *error) {
             NSLog(@"Error: %@", error);
             if(failure) {
                 failure([error localizedDescription]);
             }
         }];
}

- (void)getBegWithId:(int)begId success:(void (^)(NSDictionary *))success failure:(void (^)(NSString *))failure {
    NSString *path = [NSString stringWithFormat:@"/api/begs/%d.json", begId];
    [manager GET:[self urlWithPath:path]
      parameters:[self parametersWithBody:@{}]
        progress:nil
         success:^(NSURLSessionTask *task, id responseObject) {
             NSLog(@"JSON: %@", responseObject);
             if ([responseObject objectForKey:@"error"]) {
                 if(failure) {
                     failure([responseObject objectForKey:@"error"]);
                 }
             } else {
                 if(success) {
                     success([responseObject objectForKey:@"beg"]);
                 }
             }
         } failure:^(NSURLSessionTask *operation, NSError *error) {
             NSLog(@"Error: %@", error);
             if(failure) {
                 failure([error localizedDescription]);
             }
         }];
}

- (void) broWithId:(int)begId success:(void (^)(NSDictionary *))success failure:(void (^)(NSString *))failure {
    NSString *path = [NSString stringWithFormat:@"/api/begs/%d/bro.json", begId];
    [manager POST:[self urlWithPath:path]
       parameters:[self parametersWithBody:@{}]
         progress:nil
          success:^(NSURLSessionTask *task, id responseObject) {
              NSLog(@"JSON: %@", responseObject);
              if ([responseObject objectForKey:@"error"]) {
                  if(failure) {
                      failure([responseObject objectForKey:@"error"]);
                  }
              } else {
                  if(success) {
                      success([responseObject objectForKey:@"excuse"]);
                  }
              }
          } failure:^(NSURLSessionTask *operation, NSError *error) {
              NSLog(@"Error: %@", error);
              if(failure) {
                  failure([error localizedDescription]);
              }
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
    // FIXME
    [params setObject:@"ETwJTwVgDxY7RPT8v3g6JRC6" forKey:@"token"];
    [params addEntriesFromDictionary:body];
    return params;
}

@end