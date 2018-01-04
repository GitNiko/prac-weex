//
//  NavigationRNBridge.h
//  rethrall
//
//  Created by 凌佳 on 2018/1/4.
//  Copyright © 2018年 nongfenqi. All rights reserved.
//

#ifndef NavigationRNBridge_h
#define NavigationRNBridge_h
#import <React/RCTBridgeModule.h>
#import "rethrall-Swift.h"

@interface NavigationRNBridge : NSObject<RCTBridgeModule>
+ (void)pop;
+ (void)push;
@end

#endif /* NavigationRNBridge_h */
