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
    var nextVCs: [UIViewController] = []
    var requestCode: String = ""
    var mResolve: RCTPromiseResolveBlock?
    var mReject: RCTPromiseRejectBlock?
    var mIntent: NSDictionary = NSDictionary()
    
    init(uri:String) {
        super.init(nibName: nil, bundle: nil)
        let jsCodeLocation = URL(string: uri)
        let rootView = RCTRootView(bundleURL: jsCodeLocation, moduleName: "Thrall", initialProperties: nil, launchOptions: nil)
        self.view = rootView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
}
