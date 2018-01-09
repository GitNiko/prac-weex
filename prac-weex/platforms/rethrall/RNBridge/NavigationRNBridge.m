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
    NSString *lastVCRequestCode = [Navigation getLastVCRequestCode];
    [self sendEventWithName:@"NavigationReminder" body:@{@"requestCode": lastVCRequestCode}];
    
    [Navigation pop:nil:true];
}

RCT_EXPORT_METHOD(push:(NSString*)uri requestCode:(NSString*)requestCode)
{
    NSLog(@"push in rn oc");
    [Navigation push:nil requestCode:requestCode  animated:true];
    
//    [self sendEventWithName:@"NavigationReminder" body:@{@"name":@"jack"}];
}

- (NSArray<NSString *> *)supportedEvents
{
    return @[@"NavigationReminder"];
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

//- (void)navigationEventReminderReceived:(NSNotification*)notification
//{
//    NSString *eventName = notification.userInfo[@"name"];
//    [self sendEventWithName:@"NavigationReminder" body:@{@"name": eventName}];
//}


@end
