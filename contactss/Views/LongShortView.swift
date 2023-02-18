//
//  LongShortView.swift
//  contactss
//
//  Created by Юрий  Лизунов on 06/02/23.
//

import SwiftUI

struct LongShortView: View {
    @State private var isOn = true
    @State private var isOnMini = false
    var body: some View {
        
        ScrollView{
            Section(header:
                        HStack{
                Text("TODAY")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                Spacer()
                Button(action: {
                    isOn = true
                    isOnMini = false
                })
                {Image(systemName: "line.3.horizontal")
                        .padding(.all, 5)
                        .background(isOn ? .gray : .white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                }
                Button(action: {
                    isOn = false
                    isOnMini = true
                })
                {Image(systemName: "square.grid.3x3.square")
                        .padding(.all, 5)
                        .background(isOnMini ? .gray : .white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                }
            }){
                if isOn {
                    LongCardView()
                } else {ShortCardView()
                }
            }
        }
    }
}

struct LongShortView_Previews: PreviewProvider {
    static var previews: some View {
        LongShortView()
    }
}
