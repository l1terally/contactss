import SwiftUI

struct LongCard: View {
    var df: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "HH : mm"
        return df
    }()
    @ObservedObject var lists = Lists()
    var lTasks: Task
    @State private var isSelected: Bool = false
    @State private var isMiniSelected: Bool = false
    var body: some View {
        ZStack {
            ZStack {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                            .onTapGesture {
                                isSelected.toggle()
                            }
                            .padding(.top, 8.0)
                            .font(Font.system(size: 22))
                            .foregroundColor(isSelected ? .black : .gray)
                        Text("\(lTasks.name)")
                            .font(.custom("Arial", size: 20))
                            .padding(.top, 10.0)
                            .padding(.leading, 4.0)
                            .fontWeight(.bold)
                        Spacer()
                    }.padding()
                    HStack {
                        Image(systemName: isMiniSelected ? "star.fill" : "star")
                            .onTapGesture {
                                isMiniSelected.toggle()
                            }
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Text("\(df.string(from: lTasks.timeFrom)) - \(df.string(from: lTasks.timeTo))")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }.padding(.horizontal, 26.0)
                        .padding(.vertical, 5)
                        .offset(x: 27, y: -15)
                }
            }.frame(width: 370, height: 100)
                .background(Color("Color"))
                .cornerRadius(10)
                .shadow(radius: 5)
                .ignoresSafeArea(.all)
                .onTapGesture {
                }
        }.padding(.vertical, 5)
            .padding(.horizontal, 11)
    }
}




struct LongCard_Previews: PreviewProvider {
    static var previews: some View {
        LongCard(lTasks: tasksList[0])
    }
}

