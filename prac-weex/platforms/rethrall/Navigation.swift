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
    
    @objc
    static func pop(_ dict: NSDictionary, animated: Bool = true) -> Void {
        let navi = UIApplication.shared.keyWindow?.rootViewController as! UINavigationController
        DispatchQueue.main.async {
            navi.popViewController(animated: animated)
        }
    }
    
    @objc static func push(_ param:String, animated: Bool = true) -> Void {
        DispatchQueue.main.async {
            let navi = UIApplication.shared.keyWindow?.rootViewController as! UINavigationController
            let nextVC = RNViewController()
            navi.pushViewController(nextVC, animated: animated)
//            navi.present(UIViewController, animated: , completion: {
//                <#code#>
//            })
        }
    }
    
    @objc static func getPrevVCRequestCode() -> String {
        let navi = UIApplication.shared.keyWindow?.rootViewController as! UINavigationController
        if navi.viewControllers.count > 1 {
            let prevVC = navi.viewControllers[navi.viewControllers.count - 1] as! RNViewController
            return prevVC.requestCode
        } else {
            return ""
        }
    }
    
    @objc static func getLastVCRequestCode() -> String {
        let navi = UIApplication.shared.keyWindow?.rootViewController as! UINavigationController
        if navi.viewControllers.count > 1 {
            let lastVC = navi.topViewController as! RNViewController
            return lastVC.requestCode
        } else {
            return ""
        }
    }
    
    @objc static func openUri(_ uri:String, resolve:RCTPromiseResolveBlock, reject:RCTPromiseResolveBlock) {
        resolve("test")
    }
}
