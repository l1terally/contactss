import Foundation

class CalendarRepository {
    let calendar = Calendar.current
    
    func getDates(completion: @escaping ([Day]) -> ()) {
        let calendar = Calendar.current
        let datesRange = calendar.range(of: .day, in: .year, for: .now)
        let ldates = datesRange?.compactMap {
            calendar.date(byAdding: .day, value: $0, to: .now)
        } ?? []
        completion(ldates.mapToDayObjects())
    }
}
struct Day:Identifiable {
    let id = UUID()
    let date: Date
}

extension Day {
    var dateString: String {
        date.formatted(date: .complete, time: .omitted)
    }
}

extension Array where Element == Date {
    func mapToDayObjects() -> Array<Day> {
        map {
            Day(date: $0)
        }
    }
}
