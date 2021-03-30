//
//  Date+Extension.swift
//  CommonUiUtils
//
//  Created by chenliangding on 2021/3/30.
//

import UIKit

extension Date {    
    func distanceSeconds(date: Date) -> Int {
        let time1: Int = Int(self.timeIntervalSince1970)
        let time2: Int = Int(date.timeIntervalSince1970)
        return abs(time1 - time2)
    }
    
    func isLater(date: Date) -> Bool {
        let time1: Int = Int(self.timeIntervalSince1970)
        let time2: Int = Int(date.timeIntervalSince1970)
        return time1 > time2
    }
}
