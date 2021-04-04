//
//  UIColor+Extension.swift
//  CommonUiUtils
//
//  Created by clding on 2021/4/1.
//

import UIKit

extension UIColor {    
    convenience public init(_ hexString: String) {
        let colorStr = hexString.isEmpty ? "FFFFFF" : hexString
        
        let trimmedStr = colorStr.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: trimmedStr)
        
        if trimmedStr.hasPrefix("#") {
            scanner.scanLocation = 1
        } else if trimmedStr.hasPrefix("0x") {
            scanner.scanLocation = 2
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
    
    public var HSB: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return (h, s, b, a)
    }
    
    public var toHexString: String {
        get {
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            self.getRed(&r, green: &g, blue: &b, alpha: &a)
            
            let a_val = (Int((1-a) * 255) & 0xFF) << 24
            let r_val = (Int(r * 255) & 0xFF) << 16
            let g_val = (Int(g * 255) & 0xFF) << 8
            let b_val = Int(b * 255) & 0xFF
            
            let colorInt = ((a_val | r_val) | g_val) | b_val
            
            let hexColor = String(format: "0x%08X", (colorInt & 0xFFFFFFFF));

            return hexColor
        }
    }
}
