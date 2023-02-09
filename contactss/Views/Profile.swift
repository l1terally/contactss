//
//  Profile.swift
//  contactss
//
//  Created by Юрий  Лизунов on 08/02/23.
//

import SwiftUI

struct Profile: View {
    @State private var name = ""
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $name)
            }.navigationBarTitle("PROFILE")
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
