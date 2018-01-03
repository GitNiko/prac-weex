//
//  ViewController.swift
//  rethrall
//
//  Created by 凌佳 on 2017/12/19.
//  Copyright © 2017年 nongfenqi. All rights reserved.
//

import UIKit
import WeexSDK
import TBWXDevTool

class ViewController: UIViewController {
    var instance:WXSDKInstance!
    var weexView:UIView = UIView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        WXDevTool.launchDebug(withUrl: "ws://192.168.31.108:8088/debugProxy/native")
        WXAppConfiguration.setAppGroup("NFQ")
        WXAppConfiguration.setAppGroup("rethrall")
        WXAppConfiguration.setAppVersion("1.0.0")
        WXSDKEngine.registerModule("swifter", with: NSClassFromString("NavigationWXBridge"))
        
        WXSDKEngine.initSDKEnvironment()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(self.notificationRefreshInstance), name: NSNotification.Name(rawValue: "RefreshInstance"), object: nil)
        render()
    }
    
    @objc func notificationRefreshInstance() {
        self.render()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func render() {
        if (instance) != nil {
            // 如果存在就先销毁
            instance.destroy()
        }
        instance = WXSDKInstance()
        instance.viewController = self
        instance.frame = self.view.frame
        weak var weakSelf:ViewController? = self
        
        instance.onCreate = {
            (view:UIView!) -> Void in
            if let ws = weakSelf {
                ws.weexView.removeFromSuperview()
                ws.weexView = view
                ws.view.addSubview(weakSelf!.weexView)
            } else {
                print("weak self nil")
            }
        }
        instance.onFailed = {
            (error:Error!) -> Void in
            print("fail at error: %@", error)
        }
//        let url = Bundle.main.url(forResource: "index", withExtension: "js")
//        instance!.render(with: url, options: ["bundleUrl":String.init(format: "bundlejs/", Bundle.main.bundlePath)], data: nil)
        instance.render(with: URL.init(string: "http://192.168.31.108:9999/js/index.bundle.js?_wx_tpl=http://192.168.31.108:9999/js/index.bundle.js"))
//        print("sdsd")
        
    }


}

