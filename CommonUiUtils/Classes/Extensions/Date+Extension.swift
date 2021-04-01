//
//  Date+Extension.swift
//  CommonUiUtils
//
//  Created by clding on 2021/3/30.
//

import UIKit

extension Date {    
    func adding(days: Int, hours: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date {
        let toDate = Date(timeInterval: TimeInterval(seconds + 60 * minutes + 3600 * hours + 86400 * days), since: self)
        
        return toDate
    }
}
