//
//  Runtime.h
//  Object-C
//
//  Created by ltt.fly on 15-5-22.
//  Copyright (c) 2015年 ltt.fly. All rights reserved.
//

/*
 
 typedef struct objc_class *Class;
 struct objc_class {
    Class isa;
    Class super_class;
    //followed by runtime specific details...
 };
 
 */
#import <Foundation/Foundation.h>

@interface Runtime : NSObject

//动态增加方法
-(void)dyFunction;

//动态增加类
-(void)dyNamicClass;

//动态关联实例的变量
-(void)dyObjcVar;

//测试类、对象结构
-(void)objcInstance;
-(void)objcClass;
-(void)metaClass;

//测试父类子类调用函数
-(void)func;

@end
