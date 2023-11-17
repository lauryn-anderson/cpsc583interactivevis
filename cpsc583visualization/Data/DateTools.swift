//
//  DateTools.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-15.
//

import Foundation

class DateTools {
    static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en-CA")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter
    }
    
    static func parseDate(date: String) -> Date {
        if let date = dateFormatter.date(from: date) {
            return date
        }
        return Date()
    }
    
    // NOTE: These functions are not very rigorous.
    // They are not suitable for most date-based calculations.
    // They work for my needs because I have a very constrained dataset.
    
    static let secondsInDay = 60 * 60 * 24
    static let baseDate = parseDate(date: "2023-10-24 00:00:00")
    
    static func isOn(day: Int, date: Date) -> Bool {
        let interval = date.timeIntervalSince(baseDate)
        let offset = day * secondsInDay
        let difference = Int(interval) - offset
        return difference >= 0 && difference < secondsInDay
    }
    
    static func minuteOfDay(datetime: Date) -> Int {
        let interval = datetime.timeIntervalSince(baseDate)
        let difference = Int(interval) % secondsInDay
        return difference / 60
    }
    
    static func timeOfDay(datetime: Date) -> String {
        let minuteOfDay = minuteOfDay(datetime: datetime)
        let hour: Int = minuteOfDay / 60
        let minute = minuteOfDay % 60
        if (minute < 10) {
            return String(hour) + ":0" + String(minute)
        }
        return String(hour) + ":" + String(minute)
    }
}
