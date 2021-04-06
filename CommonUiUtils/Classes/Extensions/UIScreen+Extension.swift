//
//  UIScreen+Extension.swift
//  CommonUiUtils
//
//  Created by clding on 2021/3/31.
//

import UIKit

extension UIScreen {
    public static var width: CGFloat {
        return Self.main.bounds.size.width
    }
    
    public static var height: CGFloat {
        return Self.main.bounds.size.height
    }
}
