//
//  CustomGreeter.m
//  bundle
//
//  Created by ltt.fly on 15-5-23.
//  Copyright (c) 2015年 ltt.fly. All rights reserved.
//

#import "CustomGreeter.h"

@implementation CustomGreeter

- (NSString*) greeting:(NSString*)salutation
{
    NSString *className = [NSString stringWithCString:object_getClassName(self) encoding:NSASCIIStringEncoding];
    return [NSString stringWithFormat:@"%@ %@",className, [CustomGreeter description]];
}

- (void)a
{
    NSLog(@"CustomGreeter a");
}
@end
