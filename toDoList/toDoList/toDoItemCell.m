//
//  ToDoItemCell.m
//  toDoList
//
//  Created by Sairam Sankaran on 10/11/13.
//  Copyright (c) 2013 Sairam Sankaran. All rights reserved.
//

#import "ToDoItemCell.h"

@implementation ToDoItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
