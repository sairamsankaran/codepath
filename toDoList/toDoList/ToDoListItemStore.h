//
//  ToDoListItemStore.h
//  toDoList
//
//  Created by Sairam Sankaran on 10/12/13.
//  Copyright (c) 2013 Sairam Sankaran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoListItemStore : NSObject

{
    NSMutableArray *allItems;
}

- (NSArray *) allItems;
- (NSMutableString *) createItem: (NSMutableString *)item;
- (void) removeItem: (NSMutableString *)item;
- (void) moveItemAtIndex:(int)from toIndec:(int)to;

+ (ToDoListItemStore *) sharedStore;

@end

