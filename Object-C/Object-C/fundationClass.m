//
//  fundationClass.m
//  Object-C
//
//  Created by ltt.fly on 15-5-23.
//  Copyright (c) 2015年 ltt.fly. All rights reserved.
//

#import "fundationClass.h"
#import "Greeter.h"//不加的话[greeter greeting:@"hello"]编译不过

@implementation fundationClass

-(void)testBundle:(const char *)path
{
    NSString* bundlePath;
   
    bundlePath = [NSString stringWithUTF8String:path];
    NSBundle *greeterBundle = [NSBundle bundleWithPath:bundlePath];
    if(greeterBundle == nil)
    {
        NSLog(@"bundle not found");
    }
    else
    {
        NSError *error;
        BOOL isLoaded = [greeterBundle loadAndReturnError:&error];
        if(isLoaded)
        {
            Class customGreeter = [greeterBundle classNamed:@"CustomGreeter"];
            id greeter = [[customGreeter alloc] init];
            NSLog(@"%@", [greeter greeting:@"hello"]);
            
            greeter = nil;
            if(![greeterBundle unload])
            {
                NSLog(@"can't unload bundle");
            }
        }
        else
        {
            NSLog(@"bundle not loaded, error=%@", [error localizedDescription]);
        }
    }
}
@end
