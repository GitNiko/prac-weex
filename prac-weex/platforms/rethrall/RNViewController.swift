//
//  RNViewController.swift
//  rethrall
//
//  Created by 凌佳 on 2017/12/21.
//  Copyright © 2017年 nongfenqi. All rights reserved.
//

import UIKit
import React

class RNViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        let jsCodeLocation = URL(string: "http://192.168.31.108:8081/index.ios.bundle?platform=ios&dev=true")
        let rootView = RCTRootView(bundleURL: jsCodeLocation, moduleName: "Thrall", initialProperties: nil, launchOptions: nil)
        self.view = rootView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
