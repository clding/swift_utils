//
//  UIColor+Extension.swift
//  CommonUiUtils
//
//  Created by clding on 2021/4/1.
//

import UIKit

extension UIColor {
    convenience init(_ hexString: String?) {
        if hexString?.isEmpty ?? true {
            self.init(white: 1, alpha: 1)
        } else {
            let trimmedString = hexString!.trimmingCharacters(in: .whitespacesAndNewlines)
            let scanner = Scanner(string: trimmedString)
            
            if trimmedString.hasPrefix("#") {
                scanner.scanLocation = 1
            }
            
            var color: UInt32 = 0
            scanner.scanHexInt32(&color)
            
            let mask = 0x000000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask
            let a = 255 - Int(color >> 24) & mask
            
            let red   = CGFloat(r) / 255.0
            let green = CGFloat(g) / 255.0
            let blue  = CGFloat(b) / 255.0
            let alpha  = CGFloat(a) / 255.0
            
            self.init(red: red, green: green, blue: blue, alpha: alpha)
        }
    }
}
