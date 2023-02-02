import SwiftUI

struct TasksList: View {
    @State private var isOn = true
    @State private var isOnMini = false
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Spacer()
                    Button(action: {
                        isOn = true
                        isOnMini = false
                    })
                    {Image(systemName: "heart")
                            .background(isOn ? .gray : .white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    }
                    Button(action: {
                        isOn = false
                        isOnMini = true
                    })
                    {Image(systemName: "heart")
                            .background(isOnMini ? .gray : .white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    }
                }.background(Color.white)
                if isOn {
                    LongCardView()
                } else {ShortCardView()
                }
            }
        }
    }
}


struct TasksList_Previews: PreviewProvider {
    static var previews: some View {
        TasksList()
    }
}


