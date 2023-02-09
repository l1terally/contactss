import SwiftUI

struct TasksList: View {
    @State private var isOn = true
    @State private var isOnMini = false
    @State var switc = 1
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    if switc == 1 {
                        LongShortView()
                    }else{
                        Profile()
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            self.switc = 1
                        })
                        {
                            VStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 35, height:
                                            3)
                                    .offset(y: 7)
                                    .foregroundColor(switc == 1 ? Color(.black) : Color(.white))
                                Image(systemName: "house")
                                    .padding(.all)
                                    .foregroundColor(.black)
                            }
                        }
                        Spacer()
                            VStack {
                                NavigationLink(destination: TaskAdd()){
                                Image(systemName: "plus")
                                    .padding(.all)
                                    .frame(width: 80)
                                    .background(Color(.black))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    
                            }
                        }
                        Spacer()
                        Button(action: {
                            self.switc = 2
                        }) {
                            VStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 35, height:
                                            3)
                                    .offset(y: 7)
                                    .foregroundColor(switc  == 2 ? Color(.black) : Color(.white))
                                Image(systemName: "person")
                                    .padding(.all)
                                    .foregroundColor(.black)
                            }
                        }
                        Spacer()
                    }.frame(width: 450, height: 50)
                    .font(.custom("LargeTitle", size: 25))
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


