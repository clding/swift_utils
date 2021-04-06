//
//  Array+Extension.swift
//  CommonUiUtils
//
//  Created by clding on 2021/3/30.
//

import UIKit

extension Array where Element: Equatable {
    mutating public func removeFromFirst(_ object: Element) {
        if let index = firstIndex(of: object) {
            remove(at: index)
        }
    }
    
    mutating public func removeFromLast(_ object: Element) {
        if let index = lastIndex(of: object) {
            remove(at: index)
        }
    }

    public func random() -> Element? {
        if self.count == 0 {
            return nil
        } else if self.count == 1 {
            return self[0]
        } else {
            let index = Int(arc4random_uniform(UInt32(self.count)))
            return self[index]
        }
    }
}
