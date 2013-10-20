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

+ (void)moviesWithJSON:(NSArray *)jsonArray {
    //    for (NSDictionary *jsonMovie in jsonArray) {
    //        Movie *movie = [[Movie alloc] init];
    //        NSString *title = [jsonMovie valueForKey:@"title"];
    //        movie.title = title;
    //        [[MovieDataStore sharedStore] addMovieToStore:movie];
    //    }
    Movie *movie = [[Movie alloc] init];
    NSString *title = @"Captain Philips";
    NSString *cast = @"Tom Hanks";
    movie.title = title;
    movie.cast = cast;
    [[MovieDataStore sharedStore] addMovieToStore:movie];
    NSLog(@"Captain Hanks added to data store");
    NSLog(@"Movie title: %@", [[[[MovieDataStore sharedStore] boxOfficeMovies] objectAtIndex:0] title]);
}

@end
