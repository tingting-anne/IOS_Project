//
//  AspectProxy.m
//  Object-C
//
//  Created by ltt.fly on 15-5-25.
//  Copyright (c) 2015年 ltt.fly. All rights reserved.
//

#import "AspectProxy.h"

@implementation AspectProxy

-(id)initWithObject:(id)object selectors:(NSArray *)selectors andInvoker:(id<Invoker>)invoker
{
    _proxyTarget = object;
    _invoker = invoker;
    _selectors = [selectors mutableCopy];
    return self;
}

-(id)initWithObject:(id)object andInvoker:(id<Invoker>)invoker
{
    return [self initWithObject:object selectors:nil andInvoker:invoker];
}

-(void)registerSeletor:(SEL)selector
{
    //将SEL封装成id,加入selectors
    NSValue* selValue = [NSValue valueWithPointer:selector];
    [self.selectors addObject:selValue];
}

-(NSMethodSignature*)methodSignatureForSelector:(SEL)sel
{
    return [self.proxyTarget methodSignatureForSelector:sel];
}

-(void)forwardInvocation:(NSInvocation *)invocation
{
    if([self.invoker respondsToSelector:@selector(preInvoke:withTarget:)])
    {
        if(self.selectors != nil)
        {
            SEL methodSel = [invocation selector];
            for (NSValue* selValue in self.selectors)
            {
                if(methodSel == [selValue pointerValue])
                {
                    [[self invoker] preInvoke:invocation withTarget:self.proxyTarget];
                    break;
                }
            }
        }
        else
        {
            [[self invoker] preInvoke:invocation withTarget:self.proxyTarget];
        }
    }
    
    [invocation invokeWithTarget:self.proxyTarget];
    
    if([self.invoker respondsToSelector:@selector(postInvoke:withTarget:)])
    {
        if(self.selectors != nil)
        {
            SEL methodSel = [invocation selector];
            for (NSValue* selValue in self.selectors)
            {
                if(methodSel == [selValue pointerValue])
                {
                    [[self invoker] postInvoke:invocation withTarget:self.proxyTarget];
                    break;
                }
            }
        }
        else
        {
            [[self invoker] postInvoke:invocation withTarget:self.proxyTarget];
        }
    }
}

@end
