//
//  MovieDataStore.h
//  rottenTomatoes
//
//  Created by Sairam Sankaran on 10/20/13.
//  Copyright (c) 2013 Sairam Sankaran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieDataStore : NSObject
{
    NSMutableArray *boxOfficeMovies; // array of movies in box office
}

- (NSArray *) boxOfficeMovies;
+ (MovieDataStore *) sharedStore;
// factory or class method because, need to use for various endpoints
// i.e. movies are returned not by just box_office in the API
+ (NSArray *)moviesWithJSON:(NSArray *)jsonArray;

@end
