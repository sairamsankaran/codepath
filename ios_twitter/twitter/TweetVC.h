//
//  TweetVC.h
//  twitter
//
//  Created by Sairam Sankaran on 10/21/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetVC : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetAgeTextLabel;

@property (nonatomic, strong) Tweet *tweet;

@end
