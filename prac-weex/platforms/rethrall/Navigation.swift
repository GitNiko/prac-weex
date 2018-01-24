//
//  Navigation.swift
//  rethrall
//
//  Created by 凌佳 on 2017/12/28.
//  Copyright © 2017年 nongfenqi. All rights reserved.
//

import Foundation
import React

@objc(Navigation)
class Navigation: NSObject {
    @objc func openUri(_ intent:NSDictionary, resolve:@escaping RCTPromiseResolveBlock, reject:@escaping RCTPromiseRejectBlock) {
        // intent 需要放进下一个VC中
        DispatchQueue.main.async {
            let navi = UIApplication.shared.keyWindow?.rootViewController as! UINavigationController
        
            let uri = intent.value(forKey: "uri") as! String
            let nextVC = RNViewController(uri:uri)
            nextVC.mReject = reject
            nextVC.mResolve = resolve
            nextVC.mIntent = intent
            navi.pushViewController(nextVC, animated: true)
            
        }
    }
    
    @objc func setResult(_ data:NSDictionary) {
        DispatchQueue.main.async {
            let currentVC = self.getCurrentVC() as! RNViewController
            if let resolve = currentVC.mResolve {
                resolve(data)
            }
            
            currentVC.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func getIntent(_ resolve:@escaping RCTPromiseResolveBlock, reject:@escaping RCTPromiseRejectBlock) {
        DispatchQueue.main.async {
            let currentVC = self.getCurrentVC() as! RNViewController
            resolve(currentVC.mIntent)
        }
    }
    
    @objc func registFont(_ filePath:String) -> Bool {
        // 如果字体已经注册过了，则无法注册，即使注销也会返回false，原因不明，推测是内字体加载后就被引用了且无法被回收。
        // 目前只能不把字体放到app中，通过远程下载后加载指定路径下的字体。
        guard let provider = CGDataProvider(filename: filePath) else {
            return false
        }
        
        let font = CGFont(provider)
//        if let fc = CGFont.init(NSString.init(string: "iconfont")) {
//            print(fc)
//            let iconPath = Bundle.main.path(forResource: "iconfont", ofType: "ttf")
////            let sss = CTFontManagerUnregisterGraphicsFont(fc, nil)
//            let iconUrl = NSURL.init(fileURLWithPath: iconPath!)
//            let error:UnsafeMutablePointer<Unmanaged<CFError>?>? = nil
////            guard CTFontManagerUnregisterGraphicsFont(fc, error) else {
////                let s = error?.pointee?.takeUnretainedValue()
//////                let errordesc = CFErrorCopyDescription(error?.pointee?.takeUnretainedValue())
//////                print(errordesc!)
////                return false
////            }
//
//        }
//        let result = CTFontManagerRegisterFontsForURL(path, CTFontManagerScope.process, nil)
        let registerError:UnsafeMutablePointer<Unmanaged<CFError>?>? = nil
        let result = CTFontManagerRegisterGraphicsFont(font, registerError)
        return result
    }
    
    func getCurrentVC() -> UIViewController? {
        let navi = UIApplication.shared.keyWindow?.rootViewController as! UINavigationController
        return navi.topViewController
    }
    
    
    
}
