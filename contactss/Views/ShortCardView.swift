import SwiftUI

struct ShortCardView: View {
    @State private var isOn = true
    @State private var isOnMini = false
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 0)]
    @State var dates: [Day] = []
    let calendarRepository = CalendarRepository()
    @ObservedObject var lists = Lists()
    var body: some View {
        ScrollView() {
            ForEach(dates) { day in
                    VStack(alignment: .leading) {
                        Section(header: Text("\(day.dateString)")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                        ){
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(lists.items, id: \.id) { lTasks in
                                ShortCard(lTasks: lTasks)
                            }
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

struct ShortCardView_Previews: PreviewProvider {
    static var previews: some View {
        ShortCardView()
    }
}
