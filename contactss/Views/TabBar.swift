//
//  TabBar.swift
//  contactss
//
//  Created by Юрий  Лизунов on 06/02/23.
//

import SwiftUI

struct TabBar: View {
    @State var switc = 1
    var body: some View {
        VStack {
            Spacer()
            ZStack {
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
                    Button(action: {
                        //
                    }) {
                        VStack {
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
                }.font(.custom("LargeTitle", size: 25))
            }
        }.frame(width: 400, height: 60)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
