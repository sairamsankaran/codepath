//
//  converterViewController.m
//  tempConverter
//
//  Created by Sairam Sankaran on 10/3/13.
//  Copyright (c) 2013 Sairam Sankaran. All rights reserved.
//

#import "converterViewController.h"

@interface converterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *tempInFahrenheitTextField;
@property (weak, nonatomic) IBOutlet UITextField *tempInCelsiusTextField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (strong, nonatomic) UITextField *lastEditedTextField;
- (IBAction)onTap:(id)sender;
- (IBAction)convertButtonTouchDown:(id)sender;
- (void) convertTemperatures;
@end

@implementation converterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Convert Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.convertButton setBackgroundColor:[UIColor grayColor]]; //set convert button background color
    self.convertButton.showsTouchWhenHighlighted = YES; // convert button highlughts on tap
    self.tempInFahrenheitTextField.tag = 1;
    self.tempInCelsiusTextField.tag = 2;
    self.tempInCelsiusTextField.delegate = self; // textfield calls back to converterViewController
    self.tempInFahrenheitTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES]; // keyboard goes off
}


- (IBAction)convertButtonTouchDown:(id)sender {
    if (self.lastEditedTextField.text.length > 0) {
        [self convertTemperatures];
    }
}

- (void) convertTemperatures{
    if (self.lastEditedTextField.tag == 1){ // F changed
        float tempInFahrenheit = [self.tempInFahrenheitTextField.text floatValue];
        float tempInCelsius = (tempInFahrenheit - 32)*5/9;
        self.tempInCelsiusTextField.text = [NSString stringWithFormat:@"%0.2f", tempInCelsius];
    }
    else if (self.lastEditedTextField.tag == 2){ // C changed
        float tempInCelsius = [self.tempInCelsiusTextField.text floatValue];
        float tempInFahrenheit = (tempInCelsius*9/5) + 32;
        self.tempInFahrenheitTextField.text = [NSString stringWithFormat:@"%0.2f", tempInFahrenheit];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.lastEditedTextField = textField; // make a note of the last edited text field
}
@end
