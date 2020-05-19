//
//  AppLanguage.swift
//  multi_language
//
//  Created by GDM on 2020/5/19.
//  Copyright © 2020 GDM. All rights reserved.
//

import Foundation
/// 设置选定语言
var selectedLanguage = 0

struct AppLanguage {
    
    static var shared = AppLanguage()
    
    /// 重写NSLocalizedString方法 增加特定bundle
    func localizedString(key: String, comment: String) -> String {
        return NSLocalizedString(key, bundle: getCurrentBundle(), comment: comment)
    }
    
    /// 获取当前bundle
    func getCurrentBundle() -> Bundle {
        let path = Bundle.main.path(forResource: getResourceList()[selectedLanguage], ofType: "lproj")!
        
        return Bundle(path: path)!
    }
    
    /// 获取语言列表
    func getResourceList() -> [String] {
        var paths = Bundle.main.paths(forResourcesOfType: "lproj", inDirectory: nil)
        paths = paths.map { val -> String in
            return URL(string: val)!.deletingPathExtension().lastPathComponent
        }
        paths.removeAll(where: { $0.contains("Base") })
        return paths
    }
}
