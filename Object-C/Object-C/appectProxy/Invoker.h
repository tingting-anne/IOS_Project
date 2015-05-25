//
//  Invoker.h
//  Object-C
//
//  Created by ltt.fly on 15-5-25.
//  Copyright (c) 2015年 ltt.fly. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Invoker <NSObject>

@required
- (void)preInvoke: (NSInvocation*)inv withTarget: (id)target;

@optional
- (void)postInvoke:(NSInvocation*)inv withTarget:(id)target;

@end
