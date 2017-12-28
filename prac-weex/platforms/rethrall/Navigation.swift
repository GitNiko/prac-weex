//
//  Navigation.swift
//  rethrall
//
//  Created by 凌佳 on 2017/12/28.
//  Copyright © 2017年 nongfenqi. All rights reserved.
//

import Foundation

@objc(Navigaition)
class Navigaition: NSObject {
    @objc static func pop() -> Void {
        let navi = UIApplication.shared.keyWindow?.rootViewController as! UINavigationController
        navi.popViewController(animated: true)
    }
}
