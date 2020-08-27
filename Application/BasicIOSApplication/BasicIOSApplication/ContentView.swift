//
//  ContentView.swift
//  BasicIOSApplication
//
//  Created by Thao Nguyen on 8/26/20.
//  Copyright © 2020 Thao Nguyen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible = false
    var body: some View {
        VStack{
            Text("Hello Thao Nguyen").fontWeight(.bold).foregroundColor(.blue)
            Button(action: {
                print("Button is pushed")
                self.alertIsVisible = true
            }) {
                Text("Hit me")
            }
            .alert(isPresented: self.$alertIsVisible){
                Alert(title: Text("Hello there"), message: Text("Hello all of developer from Thao Nguyen developer!"), dismissButton: .default(Text("Awesome!")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
