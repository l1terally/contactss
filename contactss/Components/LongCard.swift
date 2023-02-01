import SwiftUI

struct LongCard: View {
    var df: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "MMM d, yyyy"
        return df
    }()
    var lTasks: SectionData
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
                        Text("\((df.string(from: lTasks.date)))")
                            .font(.custom("Arial", size: 20))
                            .padding(.top, 10.0)
                            .padding(.leading, 4.0)
                            .fontWeight(.bold)
                        Spacer()
                        Button(action: {
                            //
                        })
                        { Image(systemName: "ellipsis")
                        }
                        .rotationEffect(Angle(degrees: 90))
                        .padding(.top, 10.0)
                        .foregroundColor(.gray)
                        .font(Font.system(size: 17))
                    }.padding()
                    HStack {
                        Image(systemName: isMiniSelected ? "star.fill" : "star")
                            .onTapGesture {
                                isMiniSelected.toggle()
                            }
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Text("TEXT")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }.padding(.horizontal, 26.0)
                        .padding(.vertical, 5)
                        .offset(x: 27, y: -15)
                }
            }.frame(width: 360, height: 100)
                .background(Color("Color"))
                .cornerRadius(10)
                .shadow(radius: 5)
                .ignoresSafeArea(.all)
        }.padding(.all, 5)
    }
}



