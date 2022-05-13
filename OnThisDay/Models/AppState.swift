//
// Created by Simon Rofe on 13/5/2022.
//

import Foundation

class AppState: ObservableObject {
    @Published var days: [String: Day] = [:]
    @Published var loadingError = false
    @Published var isLoading = false

    init() {
        Task {
            await getToday()
        }
    }

    func dataFor(eventType: EventType?, date: String? = nil, searchText: String = "") -> [Event] {
        let requestedDate = date ?? today
        if let day = days[requestedDate] {
            let events: [Event]
            switch eventType {
            case .births:
                events = day.births
            case .deaths:
                events = day.deaths
            case .events, .none:
                events = day.events
            }

            if searchText.isEmpty {
                return events
            } else {
                let searchTextLower = searchText.lowercased()
                let filteredEntries = events.filter { event in
                    event.text.lowercased().contains(searchTextLower) || event.year.lowercased().contains(searchTextLower)
                }
                return filteredEntries
            }
        }

        if let date = date {
            downloadMissingEvents(for: date)
        }

        return []
    }

    func countFor(eventType: EventType = .events, date: String? = nil, searchText: String = "") -> Int {
        let events = dataFor(eventType: eventType, date: date, searchText: searchText)
        return events.count
    }

    @MainActor func getToday() async {
        let (month, day) = currentMonthAndDay()
        await getDataFor(month: month, day: day)
    }

    @MainActor func getDataFor(month: Int, day: Int) async {
        loadingError = false
        isLoading = true
        defer {
            isLoading = false
        }

        let monthName = englishMonthNames[month - 1]
        let dateString = "\(monthName)\(day)"
        if days[dateString] != nil {
            return
        }

        do {
            let newData = try await Networker.getDataForDay(month: month, day: day)
            days[newData.displayDate] = newData
        } catch {
            loadingError = true
        }
    }

    func toggleEventsFor(date: String?) {
        if let date = date, let day = days[date] {
            days[date] = nil
            days[date] = day
        }
    }

    func currentMonthAndDay() -> (monthNum: Int, dayNum: Int) {
        let calendarDate = Calendar.current.dateComponents([.day, .month], from: Date())

        if let dayNum = calendarDate.day, let monthNum = calendarDate.month {
            return (monthNum, dayNum)
        }
        return (1, 1)
    }

    var today: String {
        let (monthNum, dayNum) = currentMonthAndDay()
        let month = englishMonthNames[monthNum - 1]
        return "\(month)\(dayNum)"
    }

    var sortedDates: [String] {
        let dates = days.values.compactMap { day in
            return day.displayDate
        }

        let sortedDates = dates.sorted { lhs, rhs in
            let lhParts = lhs.components(separatedBy: " ")
            let rhParts = rhs.components(separatedBy: " ")
            let lhMonth = lhParts[0]
            let rhMonth = rhParts[0]
            let lhDay = Int(lhParts[1]) ?? 32
            let rhDay = Int(rhParts[1]) ?? 32
            let lhMonthNumber = englishMonthNames.firstIndex(of: lhMonth) ?? 13
            let rhMonthNumber = englishMonthNames.firstIndex(of: rhMonth) ?? 13
            return (lhMonthNumber * 100 + lhDay) < (rhMonthNumber * 100 + rhDay)
        }

        return sortedDates
    }

    func downloadMissingEvents(for date: String) {
        if isLoading {
            return
        }
        isLoading = true

        let dateParts = date.components(separatedBy: " ")
        if dateParts.count < 2 {
            return
        }
        guard let day = Int(dateParts[1]) else {
            return
        }
        guard let monthIndex = englishMonthNames.firstIndex(of: dateParts[0]) else {
            return
        }

        Task {
            await getDataFor(month: monthIndex + 1, day: day)
        }
    }

    var englishMonthNames = [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"
    ]
}
