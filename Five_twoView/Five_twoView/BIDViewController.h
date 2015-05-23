//
//  BIDViewController.h
//  Five_twoView
//
//  Created by ltt.fly on 15-5-21.
//  Copyright (c) 2015年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *portrait;
@property (strong, nonatomic) IBOutlet UIView *landscape;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *foos;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *bars;

- (IBAction)buttonTapped:(id)sender;
@end
