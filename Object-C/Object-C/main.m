//
//  main.m
//  Object-C
//
//  Created by ltt.fly on 15-5-22.
//  Copyright (c) 2015年 ltt.fly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "runtime/Runtime.h"
#import "bridge/bridge.h"
#import "./protocal/BasicGreeter.h"
#import "./bundle/fundationClass.h"
#import "appectProxy/proxyTest.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSLog(@"test begin ,scanf the test case");
        char testCase[32];
        scanf("%s", testCase);
        NSString *test = [NSString stringWithUTF8String:testCase];
        
        if([test isEqualToString:[NSString stringWithUTF8String:"runtime"]])
        {
            Runtime* runTime = [[Runtime alloc] init];
            [runTime dyFunction];
            [runTime dyNamicClass];
            [runTime dyObjcVar];
            [runTime objcInstance];
            [runTime objcClass];
            [runTime metaClass];
            [runTime func];
        }
        else if([test isEqualToString:[NSString stringWithUTF8String:"bridge"]])
        {
            bridge *b = [[bridge alloc] init];
            [b bridgeTest];
        }
        else if([test isEqualToString:[NSString stringWithUTF8String:"protocal"]])
        {
            //protocal
            //只要调用的.m包含了协议，Greeter.h, 将任意类对象转成id，然后调用Greeter中的方法都可以编译过，但是运行死机，
            //如果没有包含Greeter.h, 则编译错误
            BasicGreeter *basic = [[BasicGreeter alloc] init]; //必须遵守协议，否则BasicGreeter.h中没有定义a方法，编译不过
            [basic a];
            
            id<Greeter> greeter = [[BasicGreeter alloc] init]; //强制成Id，并且遵守Greeter方法
            NSLog(@"%@", [greeter greeting:@"Hello"]);
            [greeter a];
            
            //char a[1024];
            //scanf("%s", a);
        }
        else if([test isEqualToString:[NSString stringWithUTF8String:"bundle"]])
        {
            fundationClass* bundletest = [[fundationClass alloc]init];
            [bundletest testBundle:argv[1]];
        }
        else if([test isEqualToString:[NSString stringWithUTF8String:"proxy"]])
        {
            proxyTest* proxyTestIns = [[proxyTest alloc] init];
            [proxyTestIns testProxy];
        }
        else
        {
            NSLog(@"test case name error");
        }
    }
    return 0;
}

