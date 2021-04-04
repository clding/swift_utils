//
//  AppBasicUtils.swift
//  CommonUiUtils
//
//  Created by clding on 2021/3/31.
//

import UIKit

public class AppBasicUtils: NSObject {    
    public class func countryCode() -> String {
        let countryCode = NSLocale.current.regionCode
        return countryCode ?? ""
    }
    
    public class func languageCode() -> String {
        let firstLang = NSLocale.preferredLanguages.first
        return firstLang?.components(separatedBy: "-").first ?? ""
    }
    
    public static func bundleId() -> String {
        if let info = Bundle.main.infoDictionary {
            let bundle = info[kCFBundleIdentifierKey as String] as? String ?? "not defined"
            return bundle
        }
        return ""
    }
}
