//
//  Date+Extension.swift
//
//  Copyright 2024 Raonsecure
//

import Foundation

extension Date {
    public static func getUTC0Date(seconds : UInt) -> String
    {
        var date = Date()
        if seconds > 0
        {
            let doubleSec = TimeInterval(seconds)
            date.addTimeInterval(doubleSec)
        }
        
        let formatter = DateFormatter()
        formatter.timeZone = .init(identifier: "UTC")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        formatter.locale = .init(identifier: "en_US_POSIX")
        
        return formatter.string(from: date)
    }
}
