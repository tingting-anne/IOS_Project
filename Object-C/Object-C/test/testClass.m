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

@implementation Calculator

-(NSNumber*)sumAddend1:(NSNumber *)a1 addend2:(NSNumber *)a2
{
    NSLog(@"invoking method on %@ object with selector %@", [self className], NSStringFromSelector(_cmd));
    //_cmd表示当前函数的SEL
    return [NSNumber numberWithInteger:([a1 integerValue] + [a2 integerValue])];
}

-(NSNumber*)sumAddend1:(NSNumber*)a1 :(NSNumber*)a2
{
    NSLog(@"invoking method on %@ object with selector %@", [self className], NSStringFromSelector(_cmd));
    //_cmd表示当前函数的SEL
    return [NSNumber numberWithInteger:([a1 integerValue] + [a2 integerValue])];
}

@end

