//
//  AppBasicUtils.swift
//  CommonUiUtils
//
//  Created by clding on 2021/3/31.
//

import UIKit

class AppBasicUtils: NSObject {    
    class func countryCode() -> String {
        let countryCode = NSLocale.current.regionCode
        return countryCode ?? ""
    }
    
    class func languageCode() -> String {
        let firstLang = NSLocale.preferredLanguages.first
        return firstLang?.components(separatedBy: "-").first ?? ""
    }
    
    static func bundleId() -> String {
        if let info = Bundle.main.infoDictionary {
            let bundle = info[kCFBundleIdentifierKey as String] as? String ?? "not defined"
            return bundle
        }
        return ""
    }
}
