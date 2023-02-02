import SwiftUI

struct ShortCardView: View {
    @State private var isOn = true
    @State private var isOnMini = false
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 30)]
    var body: some View {
        ScrollView() {
            VStack(alignment: .leading) {
                HStack {
                    Text("TODAY")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }.background(Color.white)
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(data, id: \.id) { lTasks in
                        ShortCard(lTasks: lTasks)
                    }
                }
                Text("TOMORROW")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                LazyVGrid(columns: columns) {
                    ForEach(data, id: \.id) { lTasks in
                        ShortCard(lTasks: lTasks)
                    }
                }
            }.padding(.horizontal)
        }
    }
}

struct ShortCardView_Previews: PreviewProvider {
    static var previews: some View {
        ShortCardView()
    }
}
