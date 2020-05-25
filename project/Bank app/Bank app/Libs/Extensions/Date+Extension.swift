import Foundation
import UIKit

extension Date {
    
    var yesterday: Date {
        
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    
    var day: Int {
        
        return Calendar.current.component(.day, from: self)
    }
    
    var tomorrow: Date {
        
        return Calendar.current.date(byAdding: .day, value: +1, to: self)!
    }
    
    var month: Int {
        
        return Calendar.current.component(.month, from: self)
    }
    
    var year: Int {
        
        return Calendar.current.component(.year, from: self)
    }
    
    var lastMonth: Int {
        
        return self.month - 1
    }
    
    var yesterdayMonth: Int {
        
        return Calendar.current.component(.month, from: self.yesterday)
    }
    
    var firstDayMonth: Date {
        
        let comp: DateComponents = Calendar.current.dateComponents([.year, .month], from: self)
        let startOfMonth = Calendar.current.date(from: comp)!
        return startOfMonth
    }
    
    var lastDayMonth: Date {
        let year = Calendar.current.component(.year, from: self)
        let comp = DateComponents(calendar: Calendar.current, year: year, month: self.month + 1)
        let startDayOfNexMonth = Calendar.current.date(from: comp)!
        let lastDayMonth = startDayOfNexMonth.yesterday
        return lastDayMonth
    }
    
    var firstDayOfYesterdayMonth: Date {
        
        return self.yesterday.firstDayMonth
    }
    
    public static func createDate(day: Int, month: Int, year: Int) -> Date {
        
        return Calendar.current.date(from: DateComponents(year: year, month: month, day: day))!
    }
    
    var mondayOfFirstWeekOfMonth: Date {
        
        let calendar = Calendar.current
        //We convert the index of the week by default Sunday 1, Monday 2 ... Saturday 7 a Monday 1, Tuesday 2 ... Sunday 7
        var dayOfWeek = calendar.component(.weekday, from: self.firstDayMonth) + 1 - calendar.firstWeekday
        if dayOfWeek <= 0 {
            dayOfWeek += 7
        }
        
        // We subtract 1 from the index that you give us to then subtract as many numbers of days as we value this weekIndex to self
        let weekIndex = dayOfWeek - 1
        
        return Calendar.current.date(byAdding: .day, value: -(abs(weekIndex)), to: self.firstDayMonth)!
        
    }
    
    var sundayOfLastWeekOfMonth: Date {
        
        let calendar = Calendar.current
        //We convert the index of the week by default Sunday 1, Monday 2 ... Saturday 7 a Monday 1, Tuesday 2 ... Sunday 7
        var dayOfWeek = calendar.component(.weekday, from: self.lastDayMonth) + 1 - calendar.firstWeekday
        if dayOfWeek <= 0 {
            dayOfWeek += 7
        }
        
        // We subtract 1 from the index that you give us to then subtract as many numbers of days as we value this weekIndex to self
        let weekIndex = 7 - dayOfWeek
        
        return Calendar.current.date(byAdding: .day, value: +(abs(weekIndex)), to: self.lastDayMonth)!
    }
    
    static func getDateOfIndexMonth(monthIndex: Int) -> Date {
        
        let year = Calendar.current.component(.year, from: Date())
        let comp = DateComponents(calendar: Calendar.current, year: year, month: monthIndex)
        return Calendar.current.date(from: comp)!
    }
    
   
    var millisecondsSince1970:Int {
        return Int((self.timeIntervalSince1970).rounded())
    }
        
    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
    
    public func format(format: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: self)
    }
    
    /**
     Function that returns the date formated depending on the device local.
     
     This function will return "09/08/2019" for US users, "08/09/2019" for United Kingdom users, and "08.09.2019" for German users
     */
    public func formatDateFromLocale() -> String{
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.setLocalizedDateFormatFromTemplate("ddMMyyyy")
        
        return formatter.string(from: self)
    }
    
    public func byAdding(component: Calendar.Component, value: Int) -> Date {
        
        return Calendar.current.date(byAdding: component, value: value, to: self)!
    }
    
}
