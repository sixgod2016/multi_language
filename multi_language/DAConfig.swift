//
//  DAConfig.swift
//  multi_language
//
//  Created by GDM on 2020/5/21.
//  Copyright © 2020 GDM. All rights reserved.
//

import Foundation

// https://www.jianshu.com/p/732f2a3e9ffa

class DAConfig: NSObject {
    static let UWUserLanguageKey = "UWUserLanguageKey"
    class func setUserLanguage(userLanguage: String) {
        if userLanguage.count == 0 {
            DAConfig.resetSystemLanguage()
        }
        UserDefaults.standard.set(userLanguage, forKey: UWUserLanguageKey)
        UserDefaults.standard.set([userLanguage], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }
    
    class func getUserLanguage() -> String {
        Bundle.main.onLanguage()
        return (UserDefaults.standard.object(forKey: UWUserLanguageKey) ?? NSLocale.preferredLanguages.first!) as! String
    }
    
    class func resetSystemLanguage() {
        UserDefaults.standard.removeObject(forKey: UWUserLanguageKey)
        UserDefaults.standard.set(nil, forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }
}

class NSBundleEx: Bundle {
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        if let bundle = Bundle.getLanguageBundle() {
            return bundle.localizedString(forKey: key, value: value, table: tableName)
        } else {
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
    }
}


extension Bundle {
    private static var onLanguageDispatchOnce: () -> Void = {
        object_setClass(Bundle.main, NSBundleEx.self)
    }
    
    func onLanguage() {
        Bundle.onLanguageDispatchOnce()
    }
    
    class func getLanguageBundle() -> Bundle? {
        let languageBundlePath = Bundle.main.path(forResource: DAConfig.getUserLanguage(), ofType: "lproj")
        guard languageBundlePath != nil else {
            return nil
        }
        
        let languageBundle = Bundle(path: languageBundlePath!)
        guard languageBundle != nil else {
            return nil
        }
        return languageBundle!
    }
}
