//
//  Navigation.swift
//  rethrall
//
//  Created by 凌佳 on 2017/12/28.
//  Copyright © 2017年 nongfenqi. All rights reserved.
//

import Foundation

@objc(Navigation)
class Navigation: NSObject {
    @objc static func pop(_ dict: NSDictionary) -> Void {
        let navi = UIApplication.shared.keyWindow?.rootViewController as! UINavigationController
        navi.popViewController(animated: true)
    }
    
    @objc static func push(_ param:String) -> Void {
        let navi = UIApplication.shared.keyWindow?.rootViewController as! UINavigationController
        navi.pushViewController(RNViewController(), animated: true)
    }
}
