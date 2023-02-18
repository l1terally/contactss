import SwiftUI

struct LongCardView: View {
    @State private var isOn = true
    @State private var isOnMini = false
    @ObservedObject var lists = Lists()
    @State var dates: [Day] = []
    let calendarRepository = CalendarRepository()
    var body: some View {
        ScrollView {
            ForEach(dates) { day in
                VStack(alignment: .leading) {
                    Section(header: Text("\(day.dateString)")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    ){
                        ForEach(lists.items) { lTasks in
                            LongCard(lTasks: lTasks)
                        }
                    }
                }
            }.onAppear {
                calendarRepository.getDates(completion: { ldates in
                    self.dates = ldates
                })
            }
        }
    }
}

struct LongCardView_Previews: PreviewProvider {
    static var previews: some View {
        LongCardView()
    }
}
