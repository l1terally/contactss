import SwiftUI

struct ShortCard: View {
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
                        Text("Some friday stuff actually, and awesome plans")
                            .font(.custom("Arial", size: 19))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .lineLimit(4)
                            .padding(.leading, 5)
                        Spacer()
                        Button(action: {
                            //
                        })
                        { Image(systemName: "ellipsis")
                        }
                        .rotationEffect(Angle(degrees: 90))
                        .foregroundColor(.gray)
                        .font(Font.system(size: 17))
                        .offset(x:-3, y: -30)
                    }
        
                    HStack {
                        Image(systemName: isMiniSelected ? "star.fill" : "star")
                            .onTapGesture {
                                isMiniSelected.toggle()
                            }
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Text("12:00-13:00")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                            .onTapGesture {
                                isSelected.toggle()
                            }
                            .font(Font.system(size: 22))
                            .foregroundColor(isSelected ? .black : .gray)
                            .padding(.leading)
                            .offset(x: 0, y: -2.5)
                    }.padding(.top)
                    .padding(.leading, 5)
                }
            }.frame(width: 175, height: 150)
                .background(Color("Color"))
                .cornerRadius(10)
                .shadow(radius: 5)
                .ignoresSafeArea(.all)
        }
    }
}




struct ShortCard_Previews: PreviewProvider {
    static var previews: some View {
        ShortCard(lTasks: data[0])
    }
}


