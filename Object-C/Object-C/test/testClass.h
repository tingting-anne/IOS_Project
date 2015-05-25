//
//  testClass.h
//  Object-C
//
//  Created by ltt.fly on 15-5-22.
//  Copyright (c) 2015年 ltt.fly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface testClass : NSObject

@property (nonatomic, assign)int myInt;
@property (strong)NSString* myStr;

-(void) greeting;
-(void) func:(NSString*)param;

@end

@interface testClass1 : testClass

-(void) greeting1;
-(void) func:(NSString*)param;

@end

@interface Calculator : NSObject

-(NSNumber*)sumAddend1:(NSNumber*)a1 addend2:(NSNumber*)a2;
-(NSNumber*)sumAddend1:(NSNumber*)a1 :(NSNumber*)a2;
@end
