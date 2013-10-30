//
//  TweetVC.m
//  twitter
//
//  Created by Sairam Sankaran on 10/21/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TweetVC.h"
#import "Tweet.h"
#import "TwitterClient.h"

@interface TweetVC ()
{
    CGFloat keyboardHeight;
}

@property (weak, nonatomic) IBOutlet UITextField *replyTextField;

- (IBAction)onTap:(id)sender;
- (IBAction)retweetButtonTouchDown:(id)sender;
- (IBAction)favouriteButtonTouchDown:(id)sender;
- (IBAction)tweetButtonTouchDown:(id)sender;

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
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
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
    self.replyTextField.text = [NSString stringWithFormat:@"@%@ ",self.tweet.userTweetHandle];
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES]; // keyboard goes off
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField:textField up:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField:textField up:NO];
}

- (void) animateTextField: (UITextField*) textField up:(BOOL) up
{
    const int movementDistance = 60;
    const float movementDuration = 0.3f;
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

- (void)keyboardWasShown:(NSNotification *)notification {
    // Get the size of the keyboard.
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    CGFloat height  = ceilf(keyboardSize.height);
    self->keyboardHeight = height;
    NSLog(@"%f", height);
}

- (IBAction)retweetButtonTouchDown:(id)sender {
    //NSLog(@"Retweeted");
    //NSLog(@"%@", self.tweet.tweetIdStr);
    [[TwitterClient instance] reTweetStatusWithId:self.tweet.tweetIdStr
                                      withSuccess:^(AFHTTPRequestOperation *operation, id response) {
                                          UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success!"
                                                                                          message:@"Retweeted."
                                                                                         delegate:nil
                                                                                cancelButtonTitle:nil
                                                                                otherButtonTitles:nil];
                                          [alert show];
                                          [alert dismissWithClickedButtonIndex:0 animated:YES];
                                      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                          UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                                          message:[error localizedDescription]
                                                                                         delegate:nil
                                                                                cancelButtonTitle:@"OK"
                                                                                otherButtonTitles:nil];
                                          [alert show];
                                      }];
}

- (IBAction)favouriteButtonTouchDown:(id)sender {
    [[TwitterClient instance] favouriteStatusWithId:self.tweet.tweetIdStr
                                      withSuccess:^(AFHTTPRequestOperation *operation, id response) {
                                          UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success!"
                                                                                          message:@"Favourited."
                                                                                         delegate:nil
                                                                                cancelButtonTitle:nil
                                                                                otherButtonTitles:nil];
                                          [alert show];
                                          [alert dismissWithClickedButtonIndex:0 animated:YES];
                                      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                          UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                                          message:[error localizedDescription]
                                                                                         delegate:nil
                                                                                cancelButtonTitle:@"OK"
                                                                                otherButtonTitles:nil];
                                          [alert show];
                                      }];
}

- (IBAction)tweetButtonTouchDown:(id)sender {
    [[TwitterClient instance] replyWithStatus:self.replyTextField.text
                               toStatusWithId:self.tweet.tweetIdStr
                                  withSuccess:^(AFHTTPRequestOperation *operation, id response) {
                                      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success!"
                                                                                      message:@"Replied."
                                                                                     delegate:nil
                                                                            cancelButtonTitle:nil
                                                                            otherButtonTitles:nil];
                                      [alert show];
                                      [alert dismissWithClickedButtonIndex:0 animated:YES];
                                      [self.view endEditing:YES];
                                      self.replyTextField.text=@"";
                                      self.replyTextField.placeholder=@"Reply";
                                  } failure:^(AFHTTPRequestOperation *operation, NSError *error){
                                      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                                      message:[error localizedDescription]
                                                                                     delegate:nil
                                                                            cancelButtonTitle:@"OK"
                                                                            otherButtonTitles:nil];
                                      [alert show];
                                  }];
}

@end
