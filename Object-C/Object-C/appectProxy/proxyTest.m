//
//  proxyTest.m
//  Object-C
//
//  Created by ltt.fly on 15-5-25.
//  Copyright (c) 2015年 ltt.fly. All rights reserved.
//

#import "proxyTest.h"
#import "AspectProxy.h"
#import "AuditingInvoker.h"
#import "../test/testClass.h"

@implementation proxyTest
-(void)testProxy
{
    @autoreleasepool {
        id calculator = [[Calculator alloc] init];
        NSNumber* a1 = [NSNumber numberWithInt:25];
        NSNumber* a2 = [NSNumber numberWithInteger:-1];
        NSNumber* a3 = [NSNumber numberWithInteger:15];
        
        NSValue* selValue1 = [NSValue valueWithPointer:@selector(sumAddend1:addend2:)];
        NSArray* selValues = @[selValue1];
        //NSArray* selValues = [NSArray arrayWithObjects:selValue1, nil];
        
        
        AuditingInvoker *invoker = [[AuditingInvoker alloc] init];
        id calculatorProxy = [[AspectProxy alloc] initWithObject:calculator selectors:selValues andInvoker:invoker];
        
        [calculatorProxy sumAddend1:a1 addend2:a2];
        
        [calculatorProxy sumAddend1:a1 :a3];
        
        [calculatorProxy registerSeletor:@selector(sumAddend1::)];
        [calculatorProxy sumAddend1:a1 :a3];
    }
}
@end
