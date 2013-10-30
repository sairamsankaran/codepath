//
//  Tweet.m
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

- (NSString *)text {
    return [self.data valueOrNilForKeyPath:@"text"];
}

- (NSString *)tweetIdStr {
    return [self.data valueOrNilForKeyPath:@"id_str"];
}

- (NSString *)userName {
    return [self.data valueOrNilForKeyPath:@"user.name"];
}

- (NSString *)userTweetHandle {
    return [self.data valueOrNilForKeyPath:@"user.screen_name"];
}

- (NSString *)createdAt {
    NSString *dateStr = [self.data valueOrNilForKeyPath:@"created_at"];
    
    // Convert string to date object
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    NSDate *date = [dateFormatter dateFromString:dateStr];
    
    // Convert date object to desired output format
    [dateFormatter setDateFormat:@"MM/dd/YY"];
    dateStr = [dateFormatter stringFromDate:date];
    
    return dateStr;
}

- (NSString *)userImageURL {
    return [self.data valueOrNilForKeyPath:@"user.profile_image_url"];
}

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

@end
