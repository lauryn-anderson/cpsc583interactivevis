//
//  DateTools.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-15.
//
// Supplementary functionality for date manipulations
//

import Foundation

class DateTools {
    
    /// Define format for parsing dates from .csv file
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
    
    // NOTE: The following functions are not very rigorous.
    // They are not suitable for most date-based calculations.
    // They work for my needs because I have a very constrained dataset.
    // They would stop working as soon as timezones, daylight saving time,
    // or many other date/time-related complications are introduced!
    
    static let secondsInDay = 60 * 60 * 24
    static let baseDate = parseDate(date: "2023-10-24 00:00:00")
    
    /// Checks whether a given datetime takes place on a numbered day
    /// relative to the constant base date
    /// - Parameters:
    ///   - day: integer index of target day
    ///   - date: datetime for comparison
    /// - Returns: true iff datetime is on target day
    static func isOn(day: Int, date: Date) -> Bool {
        let interval = date.timeIntervalSince(baseDate)
        let offset = day * secondsInDay
        let difference = Int(interval) - offset
        return difference >= 0 && difference < secondsInDay
    }
    
    /// Extract minute of day from a datetime
    /// - Parameter datetime: datetime to be evaluated
    /// - Returns: number of minutes after midnight that the datetime occurs
    static func minuteOfDay(datetime: Date) -> Int {
        let interval = datetime.timeIntervalSince(baseDate)
        let difference = Int(interval) % secondsInDay
        return difference / 60
    }
    
    /// Create simple string representation of time from datetime
    /// - Parameter datetime: datetime to be represented
    /// - Returns: 24h time representation of time from datetime
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
