//
//  TasksList.swift
//  contactss
//
//  Created by Юрий  Лизунов on 16/01/23.
//

import SwiftUI

struct TasksList: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("TODAY")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    ForEach(tasksList, id: \.id) { lTasks in
                        LongCard(lTasks: lTasks)
                    }
                    Text("TOMMORROW")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    ForEach(tasksList, id: \.id) { lTasks in
                        LongCard(lTasks: lTasks)
                    }
                }.padding()
            }
        }
    }
}

struct TasksList_Previews: PreviewProvider {
    static var previews: some View {
        TasksList()
    }
}
