//
//  ComposeVC.h
//  twitter
//
//  Created by Sairam Sankaran on 10/21/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComposeVC : UIViewController <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *composeTweetTextView;

@end
