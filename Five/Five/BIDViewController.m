//
//  BIDViewController.m
//  Five
//
//  Created by ltt.fly on 15-5-21.
//  Copyright (c) 2015年 ___FULLUSERNAME___. All rights reserved.
//

#import "BIDViewController.h"

@interface BIDViewController ()

@end

@implementation BIDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIApplication *app = [UIApplication sharedApplication];
    UIInterfaceOrientation o = app.statusBarOrientation;
    [self doLayout:o];
    //NSLog([NSString stringWithFormat:@"%d", sizeof(app)]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSUInteger) supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self doLayout:toInterfaceOrientation];
}

//320*480
-(void) doLayout:(UIInterfaceOrientation) orientation
{
    if(UIInterfaceOrientationIsPortrait(orientation))
    {
        _b.frame = CGRectMake(20, 20, 280, 280);
        _b1.frame = CGRectMake(20, 320, 120, 40);
        _b2.frame = CGRectMake(20, 400, 120, 40);
        _b3.frame = CGRectMake(180, 320, 120, 40);
        _b4.frame = CGRectMake(180, 400, 120, 40);
    }
    else
    {
        _b.frame = CGRectMake(20, 20, 260, 260);
        _b1.frame = CGRectMake(320, 20, 120, 40);
        _b2.frame = CGRectMake(320, 90, 120, 40);
        _b3.frame = CGRectMake(320, 160, 120, 40);
        _b4.frame = CGRectMake(320, 230, 120, 40);
    }
}
@end
