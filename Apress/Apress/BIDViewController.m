//
//  BIDViewController.m
//  Apress
//
//  Created by ltt.fly on 14-11-16.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "BIDViewController.h"


@implementation BIDViewController


- (IBAction)buttonPressed:(UIButton *)sender {
    NSString  *title = [sender titleForState:UIControlStateNormal];
    NSString *plainText = [NSString stringWithFormat:@"%@ button pressed.", title];
    _statusString.text = plainText;
}

@end
