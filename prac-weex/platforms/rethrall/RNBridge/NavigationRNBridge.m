//
//  NavigationRNBridge.m
//  rethrall
//
//  Created by 凌佳 on 2018/1/3.
//  Copyright © 2018年 nongfenqi. All rights reserved.
//
#import "NavigationRNBridge.h"
//@interface RCT_EXTERN_MODULE(Navigation, NSObject)
//
//RCT_EXTERN_METHOD(pop:(NSDictionary*) name location:(NSDictionary*)location)
//
////RCT_EXTERN_METHOD(push:(NSString*) cc)
//@end
//
@implementation NavigationRNBridge

RCT_EXPORT_MODULE(Navigation)

RCT_EXPORT_METHOD(pop)
{
    NSLog(@"pop in rn oc");
    [Navigation pop:nil];
}

RCT_EXPORT_METHOD(push)
{
    NSLog(@"push in rn oc");
    [Navigation push:nil];
}



@end
