//
//  CommonUtils.swift
//  rethrall
//
//  Created by 凌佳 on 2018/2/2.
//  Copyright © 2018年 nongfenqi. All rights reserved.
//

import Foundation
import SwiftyJSON

enum CachedDirectory: String {
    case Bundle = "/bundle"
    case IconFont = "/iconfont"
}

enum UrlOfConstans: String {
    case IconFont = "www"
    case Scheme = "sds"
}


func ok() -> Void {
    print("sdsdsd")
}

// 获取缓存目录
func getCachedPath() -> String {
    return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
}

// 列出目录下的文件
func ls(path: String) -> [String] {
    let fm = FileManager.default
    if let files = try? fm.contentsOfDirectory(atPath: path) { return files }
    return []
}

// 创建目录
func mkdir(directory: String) -> Bool {
    let fm = FileManager.default
    if let _ = try? fm.createDirectory(atPath: directory, withIntermediateDirectories: true, attributes: nil) { return true }
    return false
}

// 文件是否存在
func exist(path: String) -> Bool {
    let fm = FileManager.default
    return fm.fileExists(atPath: path)
}

func getAppScheme(completionhandler ch: (_ res: JSON) -> Void) -> Void {
    if let url = URL.init(string: "https://apigalen.nongfenqi.net/region/tree?treeCount=1") {
        URLSession.shared.dataTask(with: url, completionHandler: { (data, res, error) in
            if(error != nil) {
                NSLog("get app scheme error: %s", error.debugDescription)
            } else {
                let json = JSON(data)
                ch(json)
                print(json["retCode"].int)
            }
            print("sdsd")
        }).resume()
    }
}



