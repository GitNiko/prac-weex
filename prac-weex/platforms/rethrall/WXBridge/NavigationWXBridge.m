//
//  System.m
//  rethrall
//
//  Created by 凌佳 on 2017/12/28.
//  Copyright © 2017年 nongfenqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import "NavigationWXBridge.h"
#import "rethrall-Swift.h"
// weex
@implementation NavigationWXBridge
@synthesize weexInstance;
WX_EXPORT_METHOD(@selector(naviPop:callback:))

- (void)naviPop:(NSString*)url callback:(WXModuleCallback)callback
{
    NSLog(url);
    [Navigation pop:nil];
}

@end




