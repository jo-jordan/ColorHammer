//
//  DateTimeUtil.swift
//  ColorHammer
//
//  Created by lzjlxebr on 2020/9/2.
//

import Foundation

/**
 TimeInterval < - > Date < - > String < - > TimeInterval
 */
class DateTimeUtil {
    
    /**
     Convert Date to TimeInterval
     */
    static func convertToTimeInterval(from date: Date) -> TimeInterval {
        date.timeIntervalSince1970
    }
    
    /**
     Convert Date String with DateFormat to TimeInterval
     */
    static func convertToTimeInterval(from dateString: String, dateFormat: String) -> TimeInterval {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        guard let date = dateFormatter.date(from:dateString) else {
            return TimeInterval(0)
        }
        
        return date.timeIntervalSince1970
    }
    
    
    static func convertToDate(from dateString: String, dateFormat: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        guard let date = dateFormatter.date(from:dateString) else {
            throw fatalError("")
        }
        
        return date
    }
    
}
