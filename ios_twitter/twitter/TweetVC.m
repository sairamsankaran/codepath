//
//  TweetVC.m
//  twitter
//
//  Created by Sairam Sankaran on 10/21/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TweetVC.h"
#import "Tweet.h"

@interface TweetVC ()

@end

@implementation TweetVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.userNameTextLabel.text = self.tweet.userName;
    self.userImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[self.tweet userImageURL]]]];
    CALayer * l = [self.userImageView layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:20.0];
    self.tweetTextLabel.text = self.tweet.text;
    self.tweetAgeTextLabel.text = self.tweet.createdAt;
}

@end
