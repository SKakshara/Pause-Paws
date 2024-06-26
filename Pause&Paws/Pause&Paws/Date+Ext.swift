//
//  Date+Ext.swift
//  Pause&Paws
//
//  Created by Akshara Kollu on 3/24/24.
//

import Foundation

extension Date {
    
    func monthAndYear () -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM YYYY"
        
        return formatter.string(from:self)
    }
    
    func datesOfMonth() -> [Date] {
        let calendar = Calendar.current;
        let currentMonth = calendar.component(.month, from:self)
        let currentYear = calendar.component(.year, from:self)
        
        var startDateComponents = DateComponents()
        startDateComponents.year = currentYear
        startDateComponents.month = currentMonth
        startDateComponents.day = 1;
        let startDate = calendar.date(from: startDateComponents)!
        
        var endDateComponents = DateComponents()
        endDateComponents.month = 1
        endDateComponents.day = -1
        let endDate = calendar.date(byAdding: endDateComponents, to: startDate)!
        
        var dates: [Date] = []
        var currentDate = startDate
        
        while currentDate <= endDate {
            dates.append(currentDate)
            currentDate = calendar.date(byAdding: .day, value:1, to:currentDate)!
        }
        
        return dates
        
    }
    
    func monthDayYearFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from:self)
    }
    
    func timeFromDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from:self)
    }
}

