//
//  TaskAdd.swift
//  contactss
//
//  Created by Юрий  Лизунов on 08/02/23.
//

import SwiftUI


struct TaskAdd: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var lists: Lists
    @State private var taskName = ""
    @State private var date = Date()
    @State private var time = Date()
    @State private var timeTo = Date()
    @State var selection: String = "45 minutes"
    let filter: [String] = ["No", "Every hour", "Every day","Every week", "Every month"]
    var body: some View {
        ZStack {
            Image("blw")
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("NEW TASK")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                TextField("", text: $taskName)
                    .placeholder(when: taskName.isEmpty) {
                        Text("Task Name").foregroundColor(.white)
                    }
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 0)
                    .frame(width: 35, height:
                            3)
                    .offset(x: 25,y: -5)
                    .foregroundColor(.white)
                Spacer()
            }
            
            VStack {
                VStack(alignment: .leading) {
                    Text("DATE")
                        .foregroundColor(.black)
                    DatePicker("", selection: $date, in: Date()..., displayedComponents: .date)
                }.padding()
                .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray, lineWidth: 2))
                VStack(alignment: .leading) {
                    Text("TIME FROM")
                        .foregroundColor(.black)
                    DatePicker("", selection: $time, displayedComponents: .hourAndMinute)
                }.padding()
                .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray, lineWidth: 2))
                VStack(alignment: .leading) {
                    Text("TIME TO")
                        .foregroundColor(.black)
                    DatePicker("", selection: $timeTo, in: time..., displayedComponents: .hourAndMinute)
                }.padding()
                .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray, lineWidth: 2))
                VStack{
                    Text("REPEAT")
                    Picker("REPEAT", selection: $selection, content: {
                        ForEach(filter, id: \.self) { option in
                            Text(option)
                                .tag(option)
                        }
                    }).pickerStyle(WheelPickerStyle())
                        .padding(.bottom, 40)
                }.padding()
                    .padding(.bottom)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(.gray, lineWidth: 2))
                Spacer()
                Button(action: {
                    let item = Task(name: taskName, timeFrom: time, timeTo: timeTo, date: date)
                    lists.items.append(item)
                    presentationMode.wrappedValue.dismiss()
                }){Text("SAVE")
                        .frame(width: 325)
                        .padding()
                        .background(Color(.black))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .offset(y: -30)
                }
            }.frame(height: 600)
                .padding()
            .background(Color.white)
                .cornerRadius(20)
                .offset(y: 100)
        }
    }
}

struct TaskAdd_Previews: PreviewProvider {
    static var previews: some View {
        TaskAdd(lists: Lists())
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
