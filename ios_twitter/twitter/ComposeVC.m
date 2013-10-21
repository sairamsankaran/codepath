//
//  ComposeVC.m
//  twitter
//
//  Created by Sairam Sankaran on 10/21/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "ComposeVC.h"

@interface ComposeVC ()

@end

@implementation ComposeVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Tweet" style:UIBarButtonItemStylePlain target:self action:@selector(onTweetButton)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(onCancelButton)];
    self.title=@"140";
    self.composeTweetTextView.delegate = self;
    [self.composeTweetTextView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onTweetButton {
    NSLog(@"%@", self.composeTweetTextView.text);
    [[self navigationController] setTitle:self.composeTweetTextView.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onCancelButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)textViewDidChange:(UITextView *)textView {
    NSUInteger remainingCharacters = 140 - (int)self.composeTweetTextView.text.length;
    self.title= [NSString stringWithFormat:@"%i", (int)remainingCharacters];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSUInteger tweetLength = self.composeTweetTextView.text.length;
    if (tweetLength < 140) {
        return YES;
    } else { // maximum allowable character limit reached
        return NO;
    }
}

@end
