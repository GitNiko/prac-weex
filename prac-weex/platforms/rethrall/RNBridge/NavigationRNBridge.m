#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(Navigation, NSObject)

RCT_EXTERN_METHOD(openUri:(NSDictionary *)intent resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(setResult:(NSDictionary *)data)

RCT_EXTERN_METHOD(getIntent:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)


@end
