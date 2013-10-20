//
//  RottenTomatoesClient.m
//  rottenTomatoes
//
//  Created by Sairam Sankaran on 10/19/13.
//  Copyright (c) 2013 Sairam Sankaran. All rights reserved.
//

#import "RottenTomatoesClient.h"
#import "AFNetworking.h"
#import "MovieDataStore.h"
#import "Movie.h"

@implementation RottenTomatoesClient

// custom initializer. APIs always have a base URL.
// This client should have singleton access to handle multiple requests
- (id)init {
    self = [super initWithBaseURL:[NSURL URLWithString:@"http://api.rottentomatoes.com/api/public/v1.0/"]];
    if (self) {
        // register the JSON deserializer class. Converts NSData to NSDictionary or NSArray before passing on to responseObject
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    }
    return self;
}

// one method for every resource to be attached
- (void)boxOffice {
    NSLog(@"In boxOffice");
    [self getPath:@"lists/movies/box_office.json"
       parameters:@{@"apikey": @"g9au4hv6khv6wzvzgt55gpqs"}
          success:^(AFHTTPRequestOperation *operation, id responseObject) { // if the request is successful
              NSLog(@"Request Success");
              NSArray *movies = [responseObject objectForKey:@"movies"];
              //NSLog(@"moives: %@", movies);
              [MovieDataStore moviesWithJSON:movies];
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) { // if the request failed
              NSLog(@"error: %@", [error description]);
          }];
}

@end
