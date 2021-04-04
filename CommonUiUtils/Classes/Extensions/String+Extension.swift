//
//  String+Extension.swift
//  CommonUiUtils
//
//  Created by clding on 2020/10/06.
//

import UIKit

extension String {
    public func localized(tableName: String? = nil, bundle: Bundle = Bundle.main, value: String = "", comment: String = "") -> String{
        return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: value, comment: comment)
    }
    
    public var pathExtension: String {
        get {
            return (self as NSString).pathExtension
        }
    }
    
    public var deleteExtension: String {
        get {
            return (self as NSString).deletingPathExtension
        }
    }
    
    public var lastPathComponent: String {
        get {
            return (self as NSString).lastPathComponent
        }
    }
    
    public var deleteLastComponent: String {
        get {
            return (self as NSString).deletingLastPathComponent
        }
    }
    
    public var bool: Bool {
        get {
            let lowercase = self.lowercased()
            if lowercase == "true" {
                return true
            }
            if lowercase == "yes" {
                return true
            }
            if lowercase == "1" {
                return true
            }
            return false
        }
    }
    
    public var float: CGFloat {
        get {
            return CGFloat(Float(self) ?? 0)
        }
    }
    
}
