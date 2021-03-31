//
//  UIView+Extension.swift
//  CommonUiUtils
//
//  Created by clding on 2021/3/30.
//

import UIKit

extension UIView {
    
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    var width: CGFloat {
        get {
            return bounds.size.width
        }
        set {
            bounds.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return bounds.size.height
        }
        set {
            bounds.size.height = newValue
        }
    }

    func setCorner(radius: CGFloat, borderColor: UIColor = UIColor.clear, borderWidth: CGFloat = 0.0, masksToBounds: Bool = true) {
        self.layer.cornerRadius = radius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.masksToBounds = masksToBounds
    }

}
