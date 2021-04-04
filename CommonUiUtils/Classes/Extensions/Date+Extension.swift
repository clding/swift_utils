//
//  Date+Extension.swift
//  CommonUiUtils
//
//  Created by clding on 2021/3/30.
//

import UIKit

extension Date {    
    
    public init(sinceDate: Date, addDays days: Int, hour: Int = 0, minute: Int = 0) {
        let hourOffset = hour * 3600
        let minuteOffset = minute * 60
        
        self.init(timeInterval: TimeInterval(3600 * 24 * days + hourOffset + minuteOffset), since: sinceDate)
    }
    
    public func displayText(_ formatterStr: String = "yyyy-MM-dd") -> String {
        let dateformatter = DateFormatter()

        //自定义日期格式
        dateformatter.dateFormat = formatterStr
        
        return dateformatter.string(from: self)
    }
}
