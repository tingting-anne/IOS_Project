//
//  BIDViewController.m
//  Four
//
//  Created by ltt.fly on 15-5-20.
//  Copyright (c) 2015年 ___FULLUSERNAME___. All rights reserved.
//

#import "BIDViewController.h"

@implementation BIDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.sliderLabel.text = @"50";
    UIImage *buttonImageNormal = [UIImage imageNamed:@"whiteButton.png"];
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 12, 0, 12);
    UIImage *stretchableButtonImangeNormal = [buttonImageNormal resizableImageWithCapInsets:insets];
    
    [self.doSomethingButton setBackgroundImage:stretchableButtonImangeNormal forState:UIControlStateNormal];
    
    UIImage *buttonImagePressed = [UIImage imageNamed:@"blueButton.png"];
    UIImage *strechableButtonImagePressed = [buttonImagePressed resizableImageWithCapInsets:insets];
    [self.doSomethingButton setBackgroundImage:strechableButtonImagePressed forState:UIControlStateHighlighted];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)textFiledDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}

-(IBAction)backgroundTap:(id)sender
{
    [self.nameField resignFirstResponder];
    [self.numberField resignFirstResponder];
}

- (IBAction)sliderChange:(UISlider *)sender
{
    int progress = lroundf(sender.value);
    self.sliderLabel.text = [NSString stringWithFormat:@"%d", progress];
}

- (IBAction)toggleControls:(UISegmentedControl *)sender
{
    if(sender.selectedSegmentIndex == 0)
    {
        self.leftSwitch.hidden = NO;
        self.rightSwitch.hidden = NO;
        self.doSomethingButton.hidden = YES;
    }
    else
    {
        self.leftSwitch.hidden = YES;
        self.rightSwitch.hidden = YES;
        self.doSomethingButton.hidden = NO;
    }
}

- (IBAction)switchChanged:(UISwitch *)sender
{
    BOOL setting = sender.isOn;
    [self.leftSwitch setOn:setting animated:YES];
    
}

- (IBAction)buttonPressed:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"Are you sure?"
                                  delegate:self
                                  cancelButtonTitle:@"No Way"
                                  destructiveButtonTitle:@"Yes, i'm sure!"
                                  otherButtonTitles:nil];
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != [actionSheet cancelButtonIndex])
    {
        NSString *msg = nil;
        if (self.nameField.text.length > 0)
        {
            msg = [NSString stringWithFormat:@"You can breathe easy, %@, everything went ok.", self.nameField.text];
        }
        else
        {
            msg = @"You can breathe easy, everything went ok.";
        }
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Something was done"
                              message: msg
                              delegate:self
                              cancelButtonTitle:@"Phew!"
                              otherButtonTitles:nil,
                              nil];
        
        [alert show];
    }
}
@end
