//
//  AuditingInvoker.m
//  Object-C
//
//  Created by ltt.fly on 15-5-25.
//  Copyright (c) 2015年 ltt.fly. All rights reserved.
//

#import "AuditingInvoker.h"

@implementation AuditingInvoker
- (void)preInvoke: (NSInvocation*)inv withTarget: (id)target
{
    NSLog(@"create audit log before sending message with selector %@ to %@ object", NSStringFromSelector([inv selector]), [target className]);
}

- (void)postInvoke:(NSInvocation*)inv withTarget:(id)target
{
    NSLog(@"create audit log after sending message with selector %@ to %@ object", NSStringFromSelector([inv selector]), [target className]);
}
@end
