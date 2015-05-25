//
//  bridge.m
//  Object-C
//
//  Created by ltt.fly on 15-5-22.
//  Copyright (c) 2015年 ltt.fly. All rights reserved.
//

#import "bridge.h"

@implementation bridge
-(void) bridgeTest
{
    NSString *a = [[NSString alloc] initWithFormat:@"%@", @"hello"];
    CFStringRef cStr  = (__bridge  CFStringRef)(a);
    printf("%ld\n", CFStringGetLength(cStr));
    
    NSString *b = [[NSString alloc] initWithFormat:@"%@", @"hello"];
    CFStringRef aStr  = (__bridge_retained CFStringRef)b;
    CFRelease(aStr);
    
    CFStringRef bStr  = CFStringCreateWithCString(NULL, "hello hehe", kCFStringEncodingASCII);
    NSArray *data = [NSArray arrayWithObject:(__bridge NSString*)bStr];
    CFRelease(bStr);
    
    CFStringRef dStr  = CFStringCreateWithCString(NULL, "hello hehe", kCFStringEncodingASCII);
    NSArray *data1 = [NSArray arrayWithObject:(__bridge_transfer NSString*)dStr];
}
@end
