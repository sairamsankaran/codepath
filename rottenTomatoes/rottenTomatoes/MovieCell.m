//
//  MovieCell.m
//  rottenTomatoes
//
//  Created by Sairam Sankaran on 10/18/13.
//  Copyright (c) 2013 Sairam Sankaran. All rights reserved.
//

#import "MovieCell.h"

@interface MovieCell ()

//@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
//@property (nonatomic, weak) IBOutlet UILabel *castLabel;

@end

@implementation MovieCell

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

- (void)setMovie:(Movie *)movie
{
    self.titleLabel.text = movie.title;
    self.castLabel.text = movie.cast;
}

@end
