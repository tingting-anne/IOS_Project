//
//  main.m
//  Object-C
//
//  Created by ltt.fly on 15-5-22.
//  Copyright (c) 2015年 ltt.fly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Runtime.h"
#import "bridge.h"
#import "BasicGreeter.h"
#import "fundationClass.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Runtime* runTime = [[Runtime alloc] init];
        [runTime dyFunction];
        [runTime dyNamicClass];
        [runTime objcInstance];
        [runTime objcClass];
        [runTime metaClass];
        [runTime func];
        
        bridge *b = [[bridge alloc] init];
        [b bridgeTest];
        
        //protocal
        //只要调用的.m包含了协议，Greeter.h, 将任意类对象转成id，然后调用Greeter中的方法都可以编译过，但是运行死机，
        //如果没有包含Greeter.h, 则编译错误
        BasicGreeter *basic = [[BasicGreeter alloc] init]; //必须遵守协议，否则BasicGreeter.h中没有定义a方法，编译不过
        [basic a];
        
        id<Greeter> greeter = [[BasicGreeter alloc] init]; //强制成Id，并且遵守Greeter方法
        NSLog(@"%@", [greeter greeting:@"Hello"]);
        [greeter a];
        
        char a[1024];
        scanf("%s", a);
        
        fundationClass* bundletest = [[fundationClass alloc]init];
        [bundletest testBundle:a];
    }
    return 0;
}

