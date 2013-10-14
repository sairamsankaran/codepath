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

- (NSMutableString *) createItem: (NSMutableString *)item {
    //NSString *item = newItem;
    [allItems addObject:item];
    return item;
}

- (void) removeItem: (NSMutableString *)item {
    [allItems removeObjectIdenticalTo:item];
}

- (void) moveItemAtIndex:(int)from toIndex:(int)to {
    if (from == to) {
        return;
    }
    NSMutableString *itemToMove = [allItems objectAtIndex:from];
    [allItems removeObjectAtIndex:from];
    [allItems insertObject:itemToMove atIndex:to];
}
@end

