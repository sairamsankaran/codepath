//
//  ToDoListItemStore.m
//  toDoList
//
//  Created by Sairam Sankaran on 10/12/13.
//  Copyright (c) 2013 Sairam Sankaran. All rights reserved.
//

#import "ToDoListItemStore.h"

@implementation ToDoListItemStore

- (id) init {
    self = [super init];
    if (self) {
        allItems = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (ToDoListItemStore *) sharedStore {
    static ToDoListItemStore *sharedStore = nil;
    
    if(!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

+ (id) allocWithZone:(struct _NSZone *)zone {
    return [self sharedStore];
}

- (NSArray *) allItems {
    return allItems;
}

- (void) setAllItems: (NSMutableArray *)listItems{
    //self.allItems = listItems;
    NSLog(@"From inside setAllItems. listItems = %@", listItems);
    
    for (int i = 0; i < [listItems count]; i++) {
        [allItems addObject:[NSMutableString stringWithString:[listItems objectAtIndex:i]]];
    }
//    [allItems addObject:[NSMutableString stringWithString:@"A"]];
//    [allItems addObject:[NSMutableString stringWithString:@"B"]];
//    [allItems addObject:[NSMutableString stringWithString:@"C"]];
}

- (NSMutableString *) createItem: (NSMutableString *)item {
    //NSString *item = newItem;
    [allItems addObject:item];
    
    // update userdefaults. i.e. persist items on device when allItems is updated
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:allItems forKey:@"cachedItems"];
    NSLog(@"%@ added to cache", item);
    
    return item;
}

- (void) removeItem: (NSMutableString *)item {
    [allItems removeObjectIdenticalTo:item];
    // update userdefaults. i.e. remove items on device when allItems is updated
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:allItems forKey:@"cachedItems"];
    NSLog(@"%@ removed from cache", item);
}

- (void) moveItemAtIndex:(int)from toIndex:(int)to {
    if (from == to) {
        return;
    }
    NSMutableString *itemToMove = [allItems objectAtIndex:from];
    [allItems removeObjectAtIndex:from];
    [allItems insertObject:itemToMove atIndex:to];
    
    // update userdefaults. i.e. modify items on device when allItems is updated
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:allItems forKey:@"cachedItems"];
    NSLog(@"cache modified");
}
@end

