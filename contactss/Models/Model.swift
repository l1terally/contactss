import SwiftUI

struct Task: Identifiable, Codable {
    var id = UUID()
    var name: String
    var timeFrom: Date
    var timeTo: Date
    var date: Date?
}


struct SectionData {
    var id = UUID()
    let date: Date
    let items: [Task]
}

var tasksList = [
                 Task(name: "Task0", timeFrom: .init(timeIntervalSince1970: 1274950400), timeTo: .init(timeIntervalSince1970: 1674957600)),
                 Task(name: "Task1", timeFrom: .init(timeIntervalSince1970: 1274950400), timeTo: .init(timeIntervalSince1970: 1874957600)),
                 Task(name: "Task2", timeFrom: .init(timeIntervalSince1970: 1274950400), timeTo: .init(timeIntervalSince1970: 1674957600)),
                 Task(name: "AddedTask0", timeFrom: .init(timeIntervalSince1970: 1174950400), timeTo: .init(timeIntervalSince1970: 1674957600)),
                 Task(name: "AddedTask1", timeFrom: .init(timeIntervalSince1970: 1174950400), timeTo: .init(timeIntervalSince1970: 1874957600)),
                 Task(name: "AddedTask2", timeFrom: .init(timeIntervalSince1970: 1174950400), timeTo: .init(timeIntervalSince1970: 1674957600)),
                 Task(name: "Task3", timeFrom: .init(timeIntervalSince1970: 1622950400), timeTo: .init(timeIntervalSince1970: 1674957600)),
                 Task(name: "Task4", timeFrom: .init(timeIntervalSince1970: 1622950400), timeTo: .init(timeIntervalSince1970: 1674957600)),
                 Task(name: "Task5", timeFrom: .init(timeIntervalSince1970: 1622950400), timeTo: .init(timeIntervalSince1970: 1674957600)),
                 Task(name: "AddedTask3", timeFrom: .init(timeIntervalSince1970: 1774950400), timeTo: .init(timeIntervalSince1970: 1674957600)),
                 Task(name: "AddedTask4", timeFrom: .init(timeIntervalSince1970: 1774950400), timeTo: .init(timeIntervalSince1970: 1674957600)),
                 Task(name: "Task6", timeFrom: .init(timeIntervalSince1970: 1674950400), timeTo: .init(timeIntervalSince1970: 1674957600)),
                 Task(name: "Task7", timeFrom: .init(timeIntervalSince1970: 1674950400), timeTo: .init(timeIntervalSince1970: 1674957600)),
                 Task(name: "Task8", timeFrom: .init(timeIntervalSince1970: 1674950400), timeTo: .init(timeIntervalSince1970: 1674957600))]

class Lists: ObservableObject {
    @Published var items = [Task](){
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Task].self, from: items) {
                self.items = decoded
                return
            }
        }
    }
}

let dict = Dictionary(grouping: tasksList) { task in
    let dateComponents = Calendar.current.dateComponents([.day, .month, .year], from: task.timeFrom)
    let date = Calendar.current.date(from: dateComponents)
    return date
}

let data = dict.map { (key, value) in
    return (date: key, items: value)
}.sorted(by: { $0.date! < $1.date! })
.map({ SectionData(date: $0.date!, items: $0.items)})

