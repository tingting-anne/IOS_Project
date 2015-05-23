//
//  BIDViewController.h
//  Apress
//
//  Created by ltt.fly on 14-11-16.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *statusString;

- (IBAction)buttonPressed:(UIButton *)sender;

@end
