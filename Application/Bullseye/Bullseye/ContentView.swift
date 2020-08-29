//
//  ContentView.swift
//  Bullseye
//
//  Created by Thao Nguyen on 8/29/20.
//  Copyright © 2020 Thao Nguyen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // Properties
    // ==========
    
    // User interface views
    @State var isPushed = false
    @State var sliderValue : Double = 0.0
    
    // User interface content and layout
    var body: some View {
        VStack {
            Spacer()
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to: ")
                Text("100")
            }
            
            Spacer()
            // Slider row
            HStack{
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            
            Spacer()
            // Button row
            Button(action: {
                print("Button is pushed")
                self.isPushed = true
            }) {
                Text("Hit me!")
            }
            .alert(isPresented: self.$isPushed){
                Alert(title: Text("Hello there"), message: Text("Hello IOS developer from Thao Nguyen developer! \n The slider value: \(self.sliderValue)"), dismissButton: .default(Text("awesome")))
            }
            
            Spacer()
            // Score row
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start over")
                }
                Spacer()
                Text("Score")
                Text("80")
                Spacer()
                Text("Round")
                Text("1")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("info")
                }
            }
            .padding(.all, 20)
        }
    }
    
    // Methods
    // =======
    
}

// Preview
// =======

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
