//
//  Runtime.m
//  Object-C
//
//  Created by ltt.fly on 15-5-22.
//  Copyright (c) 2015年 ltt.fly. All rights reserved.
//
#import "testClass.h"

#import "Runtime.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation Runtime

NSString *greeting(id self, SEL _cmd)
{
    return [NSString stringWithFormat:@"Hello Wrod!"];
}

NSString *funcDy(id self, SEL _cmd, int a)
{
    return [NSString stringWithFormat:@"funcDy"];
}

-(void)dyFunction
{
    @autoreleasepool {
        
        testClass *a = [[testClass alloc] init];
   
#pragma clang diagnostic push
        
        //去除警告：undeclared selector
#pragma clang diagnostic ignored  "-Wundeclared-selector"
        //types:返回值参数 i-int v-void @-id :-SEL
        class_addMethod([testClass class], @selector(funcDyadd), (IMP)funcDy, "NSString@:i");
       
        //NSLog(@"%@", [a dyFunc]);
        ///去除警告：PerformSelector may cause a leak because its selector is unknown
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        SEL selc = @selector(funcDyadd);
        NSLog(@"%@", [a performSelector:selc withObject:[NSNumber numberWithInt:2]]);
#pragma clang diagnostic pop
    }
}

-(void)dyNamicClass
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored  "-Wundeclared-selector"
    @autoreleasepool {
        
        Class dyClass = objc_allocateClassPair([NSObject class], "DyClass", 0);
        
        //下面三句和直接使用"NSString@:"效果一样
        Method descript = class_getClassMethod([NSObject class], @selector(description));
        const char *types = method_getTypeEncoding(descript);
        class_addMethod(dyClass, @selector(dyClassGreeting), (IMP)greeting, types);
        
        //types:返回值参数 i-int v-void @-id :-SEL
        //class_addMethod(dyClass, @selector(dyClassGreeting), (IMP)greeting, "NSString@:");
        objc_registerClassPair(dyClass);
        
        id dyobj =  [[dyClass alloc] init];
        NSLog(@"%@ types:%s", objc_msgSend(dyobj, @selector(dyClassGreeting)), types);
 #pragma clang diagnostic pop
    }
}

-(void)objcInstance
{
    @autoreleasepool {
        testClass *a = [[testClass alloc] init];
        testClass *b = [[testClass alloc] init];
        
        a.myInt = 0x11111111;
        a.myStr = [NSString stringWithFormat:@"a"];
        
        b.myInt = 0x22222222;
        b.myStr = [NSString stringWithFormat:@"b"];
        
        long tcSize = class_getInstanceSize([testClass class]);
        NSData *data1 = [NSData dataWithBytes:(__bridge const void*)a length:tcSize];
        NSData *data2 = [NSData dataWithBytes:(__bridge const void*)b length:tcSize];
        
        NSLog(@"a contains %@", data1);
        NSLog(@"b contains %@", data2);
        NSLog(@"class address : %p", [testClass class]);
    }
}

-(void)objcClass
{
     @autoreleasepool {
         
         Class testClz = objc_getClass("testClass");
         long sizeL = class_getInstanceSize([testClz class]);
         
         NSData *data = [NSData dataWithBytes:(__bridge const void*)testClz length:sizeL];
         NSLog(@"class testClass contain : %@", data);
         NSLog(@"testClass addr : %p, super class address : %p", [testClz class],[testClz superclass]);
     }
}

-(void)metaClass
{
    @autoreleasepool {
        
        id metaClass = objc_getMetaClass("testClass");
        long mclzSize = class_getInstanceSize([metaClass class]);
        NSData *mclzData = [NSData dataWithBytes:(__bridge const void*)metaClass length:mclzSize];
        
        NSLog(@"metaClass : %p, testClass metaClass contains : %@", metaClass, mclzData);
        class_isMetaClass(metaClass) ? NSLog(@"%s is meta class", class_getName(metaClass))\
            : NSLog(@"%s is not meta class", class_getName(metaClass));
        //元类中有isa, 父类指针， 附加信息
    }
}

-(void)func
{
    @autoreleasepool {
        
        testClass *a = [[testClass alloc] init];
        testClass1 *b = [[testClass1 alloc] init];
        
        [a greeting];
        [b greeting1];
        
        if ([a respondsToSelector: @selector(greeting)]
            && [a conformsToProtocol:@protocol(NSObject)])
        {
            [a performSelector:@selector(greeting)];
            [b performSelector:@selector(greeting)];
        }
        
        [a func:@"a"];
        [b func:@"b"];//多态
        
        if ([b respondsToSelector: @selector(func:)]
            && [b conformsToProtocol:@protocol(NSObject)])
        {
            [a performSelector:@selector(func:) withObject:@"a"];
            [b performSelector:@selector(func:) withObject:@"b"];
        }
        
    }
}
@end
