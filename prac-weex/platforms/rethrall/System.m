//
//  System.m
//  rethrall
//
//  Created by 凌佳 on 2017/12/28.
//  Copyright © 2017年 nongfenqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import "System.h"
#import "rethrall-Swift.h"
// weex
@implementation System
@synthesize weexInstance;
WX_EXPORT_METHOD(@selector(naviPop:callback:))

- (void)naviPop:(NSString*)url callback:(WXModuleCallback)callback
{
    NSLog(url);
    [Navigaition pop];
}

@end

// react native
@interface RCT_EXTERN_MODULE(Navigation, NSObject)
RCT_EXTERN_METHOD(pop)
@end

