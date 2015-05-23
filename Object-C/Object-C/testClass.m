//
//  testClass.m
//  Object-C
//
//  Created by ltt.fly on 15-5-22.
//  Copyright (c) 2015年 ltt.fly. All rights reserved.
//

#import "testClass.h"

@implementation testClass
-(void) greeting
{
    NSLog(@"testClass greeting");
}
-(void) func:(NSString*)param
{
    NSLog(@"testClass func %@", param);
}

-(void) a
{
    
}
@end

@implementation testClass1

-(void) greeting1
{
    NSLog(@"testClass1 greeting1");
}
-(void) func:(NSString*)param
{
    NSLog(@"testClass1 func %@", param);
}

@end
