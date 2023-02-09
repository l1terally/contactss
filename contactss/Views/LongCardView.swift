import SwiftUI

struct LongCardView: View {
    @State private var isOn = true
    @State private var isOnMini = false
    var body: some View {
            ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(data, id: \.id) { lTasks in
                            LongCard(lTasks: lTasks)
                        }
                }
                VStack (alignment: .leading){
                    Section(header: Text("TOMORROW")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    ) {
                        ForEach(data, id: \.id) { lTasks in
                            LongCard(lTasks: lTasks)
                        }
                    }.padding(.vertical, 2)
                }
            }
    }
}

struct LongCardView_Previews: PreviewProvider {
    static var previews: some View {
        LongCardView()
    }
}
