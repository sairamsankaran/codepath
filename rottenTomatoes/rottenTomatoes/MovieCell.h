//
//  MovieCell.h
//  rottenTomatoes
//
//  Created by Sairam Sankaran on 10/18/13.
//  Copyright (c) 2013 Sairam Sankaran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieCell : UITableViewCell

@property (nonatomic, strong) Movie *movie;

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *castLabel;

@end
