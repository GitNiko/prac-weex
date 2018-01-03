//
//  NavigationRNBridge.m
//  rethrall
//
//  Created by 凌佳 on 2018/1/3.
//  Copyright © 2018年 nongfenqi. All rights reserved.
//

#import <React/RCTBridgeModule.h>
@interface RCT_EXTERN_MODULE(Navigation, NSObject)

RCT_EXTERN_METHOD(pop:(NSDictionary*) param)

RCT_EXTERN_METHOD(push:(NSString*) cc)
@end

