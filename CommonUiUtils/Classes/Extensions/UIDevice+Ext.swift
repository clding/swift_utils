//
//  UIDevice+Ext.swift
//  CommonUiUtils
//
//  Created by clding on 2021/3/31.
//

import UIKit

extension UIDevice {
    
    public class func iPadDevice() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    public class func iPhoneDevice() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    public func safeAreaTop() -> CGFloat {
        let defaultVal: CGFloat = 20
        if let window = UIApplication.shared.delegate?.window {
            return window?.safeAreaInsets.top ?? defaultVal
        }
        return defaultVal
    }
    
    public func safeAreaBottom() -> CGFloat {
        let defaultVal: CGFloat = 0
        if let window = UIApplication.shared.delegate?.window {
            return window?.safeAreaInsets.bottom ?? defaultVal
        }
        return defaultVal
    }
  
}
