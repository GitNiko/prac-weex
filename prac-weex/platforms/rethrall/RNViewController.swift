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
        
//
//        let jsCodeLocation = URL(string: uri)
//        let rootView = RCTRootView(bundleURL: jsCodeLocation, moduleName: "Thrall", initialProperties: nil, launchOptions: nil)
//        let bridge = RCTBridge(delegate: RNBridgeDelegate.init(URL(fileURLWithPath: uri)), launchOptions: nil)
//        let rootView = RCTRootView(bridge: bridge, moduleName: "Thrall", initialProperties: nil)
//        self.view = rootView
        
        let baseLocation = URL.init(string: Bundle.main.bundlePath + "/base.bundle.js")
        let businessLocation = URL.init(string: Bundle.main.bundlePath + "/business.bundle.js")
        let bridge = RCTBridge(delegate: RNBridgeDelegate.init(businessPart: businessLocation!, basePart: baseLocation!), launchOptions: nil)
        let rootView = RCTRootView(bridge: bridge, moduleName: "Thrall", initialProperties: nil)
        self.view = rootView
    }
    
    // 初始化载入本地一个完整的bundle
    init(wholeBundleUri:URL) {
        super.init(nibName: nil, bundle: nil)
        let baseLocation = URL.init(string: Bundle.main.bundlePath + "/base.bundle.js")
        let businessLocation = URL.init(string: Bundle.main.bundlePath + "/business.bundle.js")
        let bridge = RCTBridge(delegate: RNBridgeDelegate.init(businessPart: businessLocation!, basePart: baseLocation!), launchOptions: nil)
        let rootView = RCTRootView(bridge: bridge, moduleName: "Thrall", initialProperties: nil)
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
    
    deinit {
        (self.view as! RCTRootView).bridge.invalidate()
    }
    
    
}
