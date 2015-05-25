//
//  AspectProxy.h
//  Object-C
//
//  Created by ltt.fly on 15-5-25.
//  Copyright (c) 2015年 ltt.fly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Invoker.h"

@interface AspectProxy : NSProxy

@property (strong)id proxyTarget;
@property (strong)id<Invoker> invoker;
@property (readonly)NSMutableArray* selectors;

-(id)initWithObject:(id)object andInvoker:(id<Invoker>)invoker;
-(id)initWithObject:(id)object selectors:(NSArray*)selectors andInvoker:(id<Invoker>)invoker;
-(void)registerSeletor:(SEL)selector;

@end
