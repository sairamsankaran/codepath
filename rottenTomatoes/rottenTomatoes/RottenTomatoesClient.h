//
//  RottenTomatoesClient.h
//  rottenTomatoes
//
//  Created by Sairam Sankaran on 10/19/13.
//  Copyright (c) 2013 Sairam Sankaran. All rights reserved.
//

#import "AFHTTPClient.h"

@interface RottenTomatoesClient : AFHTTPClient

- (void)boxOffice;

- (void)boxOfficeWithSuccess:(void (^)(AFHTTPRequestOperation *operation, NSArray *movies))success
                     failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
