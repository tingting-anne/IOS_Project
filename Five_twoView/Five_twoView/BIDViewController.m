//
//  BIDViewController.m
//  Five_twoView
//
//  Created by ltt.fly on 15-5-21.
//  Copyright (c) 2015年 ___FULLUSERNAME___. All rights reserved.
//

#import "BIDViewController.h"

@implementation BIDViewController

#define degressToRadians(x) (M_PI *(x)/180.0)

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //self.view = self.portrait;
   // self.view.transform = CGAffineTransformIdentity;
    //self.view.transform = CGAffineTransformMakeRotation(degressToRadians(0));
    //self.view.bounds = CGRectMake(0.0, 0.0, 320.0, 460.0);
    
    NSLog(@"viewDidLoad");

    CGAffineTransform a = self.view.transform;
    NSLog([NSString stringWithFormat:@"%lf, %lf, %lf, %lf, %lf ,%lf", a.a, a.b,a.c, a.d, a.tx, a.ty]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration
{
    //NSLog([NSString stringWithFormat:@"%u",interfaceOrientation ]);
           
    if(interfaceOrientation == UIInterfaceOrientationPortrait)
    {
         NSLog(@"UIInterfaceOrientationPortrait");
        self.view = self.portrait;
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(degressToRadians(0));
        self.view.bounds = CGRectMake(0.0, 0.0, 320.0, 460.0);
        
        CGAffineTransform a = self.view.transform;
        NSLog([NSString stringWithFormat:@"%lf, %lf, %lf, %lf, %lf ,%lf", a.a, a.b,a.c, a.d, a.tx, a.ty]);
        
               
    }
    else if(interfaceOrientation == UIInterfaceOrientationLandscapeLeft)
    {
         NSLog(@"UIInterfaceOrientationLandscapeLeft");
        self.view = self.landscape;
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(degressToRadians(0));
        self.view.transform = CGAffineTransformMakeRotation(degressToRadians(-90));
        //self.view.transform = CGAffineTransformTranslate(CGAffineTransformMakeRotation(degressToRadians(-0.5)), 0.0, 1.0);
        
        self.view.bounds = CGRectMake(0.0, 0.0, 480.0, 300.0);
        
        CGAffineTransform a = self.view.transform;
        NSLog([NSString stringWithFormat:@"%lf, %lf, %lf, %lf, %lf ,%lf", a.a, a.b,a.c, a.d, a.tx, a.ty]);
       
    }
    else if(interfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        NSLog(@"UIInterfaceOrientationLandscapeRight");
        self.view = self.landscape;
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(degressToRadians(90));
        self.view.bounds = CGRectMake(0.0, 0.0, 480.0, 300.0);
        
        CGAffineTransform a = self.view.transform;
        NSLog([NSString stringWithFormat:@"%lf, %lf, %lf, %lf, %lf ,%lf", a.a, a.b,a.c, a.d, a.tx, a.ty]);
        
    }
    
     [[UIApplication sharedApplication] setStatusBarOrientation:interfaceOrientation];
}

- (IBAction)buttonTapped:(id)sender
{
    NSString *message = nil;
    if([self.foos containsObject:sender])
    {
        message = @"Foo button pressed";
    }
    else
    {
        message = @"Bar button pressed";
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:message message:nil delegate:nil cancelButtonTitle:[NSString stringWithFormat:@"M_PI:%lf OK", M_PI] otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}
@end
