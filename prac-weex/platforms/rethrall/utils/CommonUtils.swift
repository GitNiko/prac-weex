//
//  CommonUtils.swift
//  rethrall
//
//  Created by 凌佳 on 2018/2/2.
//  Copyright © 2018年 nongfenqi. All rights reserved.
//

import Foundation

enum CachedDirectory: String {
    case Bundle = "/bundle"
    case IconFont = "/iconfont"
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

func getAppScheme() -> Void {
    if let url = NSURL.init(string: "http://localhost:8080.org/app") {
        URLSession.shared.data
    }
}



