//
//  TaskAdd.swift
//  contactss
//
//  Created by Юрий  Лизунов on 08/02/23.
//

import SwiftUI

struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            path.move(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x:rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 20))
        }
    }
}


struct TaskAdd: View {
    @State private var taskName = ""
    @State private var date = Date()
    @State var selection: String = "45 minutes"
    let filter: [String] = ["45 minutes", "1 hour", "2 hours","HII", "HIII", "HIIIII" ]
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
                Spacer()
            }
            Group {
                VStack {
                    Form {
                        Section {
                            DatePicker("DATE", selection: $date, in: Date()...)
                        }
                        Section {
                            DatePicker("STARTING TIME", selection: $date, displayedComponents: .hourAndMinute)
                            DatePicker("FINISH", selection: $date, displayedComponents: .hourAndMinute)
                            
                        }
                        Section {
                            Picker("DURATION", selection: $selection, content: {
                                ForEach(filter, id: \.self) { option in
                                    Text(option)
                                        .tag(option)
                                }
                            }).pickerStyle(MenuPickerStyle())
                        }
                    }
                    Spacer()
                    Button(action: {
                        //
                    }){Text("SAVE")
                            .padding()
                            .background(Color(.black))
                                .frame(width: 80)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .offset(y: -30)
                    }
                }.frame(height: 680)
                .background(Color.white)
                .ignoresSafeArea()
                .cornerRadius(35)
                .offset(y:70)
            }
        }
    }
}

struct TaskAdd_Previews: PreviewProvider {
    static var previews: some View {
        TaskAdd()
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
