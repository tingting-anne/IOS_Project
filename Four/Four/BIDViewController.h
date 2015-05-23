//
//  BIDViewController.h
//  Four
//
//  Created by ltt.fly on 15-5-20.
//  Copyright (c) 2015年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController<UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (weak, nonatomic) IBOutlet UIButton *doSomethingButton;

-(IBAction)textFiledDoneEditing:(id)sender;
-(IBAction)backgroundTap:(id)sender;
- (IBAction)sliderChange:(UISlider *)sender;
- (IBAction)toggleControls:(UISegmentedControl *)sender;
- (IBAction)switchChanged:(UISwitch *)sender;
- (IBAction)buttonPressed:(id)sender;

@end
