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
    
    func getCurrentVC() -> UIViewController? {
        let navi = UIApplication.shared.keyWindow?.rootViewController as! UINavigationController
        return navi.topViewController
    }
    
}
