//
//  RNBridge.swift
//  rethrall
//
//  Created by 凌佳 on 2018/1/27.
//  Copyright © 2018年 nongfenqi. All rights reserved.
//
import React

class RNBridgeDelegate: NSObject, RCTBridgeDelegate {
    var businessPart: URL
    var basePart: URL
    init(businessPart url: URL, basePart : URL) {
        self.businessPart = url
        self.basePart = basePart
    }
    func sourceURL(for bridge: RCTBridge!) -> URL! {
        return self.businessPart
    }
    
    func loadSource(for bridge: RCTBridge!, with loadCallback: RCTSourceLoadBlock!) {
        var base:NSData
        var business:NSData
        do {
//            try jsData = NSData.init(contentsOf: self.url.pa, options: NSData.ReadingOptions.mappedIfSafe)
            // 合并base和business
            
            let mergedData = NSMutableData()
            try base = NSData.init(contentsOfFile: self.basePart.path, options: NSData.ReadingOptions.mappedIfSafe)
            try business = NSData.init(contentsOfFile: self.businessPart.path, options: NSData.ReadingOptions.mappedIfSafe)
            let files = ls(path: getCachedPath())
//            files.map({ (path) -> String in
//                print(path)
//                return path
//            })
            let result = files.filter({ (path) -> Bool in
                return exist(path: "path")
            })
            print(files)
            mergedData.append(base as Data)
            mergedData.append(business as Data)
            loadCallback(nil, mergedData as Data, Int64(mergedData.length))
        } catch let error as NSError {
            loadCallback(error, nil, 0)
        }
    }
}
