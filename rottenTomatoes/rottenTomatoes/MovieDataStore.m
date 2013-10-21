//
//  MovieDataStore.m
//  rottenTomatoes
//
//  Created by Sairam Sankaran on 10/20/13.
//  Copyright (c) 2013 Sairam Sankaran. All rights reserved.
//

#import "MovieDataStore.h"
#import "Movie.h"

@implementation MovieDataStore

- (id) init {
    self = [super init];
    if (self) {
        boxOfficeMovies = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (MovieDataStore *) sharedStore {
    static MovieDataStore *sharedStore = nil;
    
    if(!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore; // return singleton instance of this class
}

+ (id) allocWithZone:(struct _NSZone *)zone {
    return [self sharedStore];
}

- (NSArray *) boxOfficeMovies {
    return boxOfficeMovies;
}

- (void) addMovieToStore: (Movie *)movie {
    [boxOfficeMovies addObject:movie];
}

+ (NSArray *)moviesWithJSON:(NSArray *)jsonArray {
    for (NSDictionary *jsonMovie in jsonArray) {
        Movie *movie = [[Movie alloc] init];
        NSString *title = [jsonMovie valueForKey:@"title"];
        movie.title = title;
        NSMutableArray *stars = [[NSMutableArray alloc] init];
        for (NSDictionary *member in [jsonMovie objectForKey:@"abridged_cast"]) {
            [stars addObject:[member objectForKey:@"name"]];
        }
        movie.cast = [stars componentsJoinedByString:@", "];
        [[MovieDataStore sharedStore] addMovieToStore:movie];
    }
    return [[MovieDataStore sharedStore] boxOfficeMovies];
}

@end
