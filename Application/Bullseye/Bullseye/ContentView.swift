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
    @State var sliderValue = 0.0
    var targetValue = Int.random(in: 1...100)
    var makeRoundSliderValue : Int{
        Int(self.sliderValue.rounded())
    }
    
    // TODO: Compact the message in alert.
    var message : String{
        "Hello IOS developer from Thao Nguyen developer \n" +
        "The slider value: \(self.makeRoundSliderValue) \n" +
        "Your score: \(calculateScoreValue())"
    }
    
    // User interface content and layout
    var body: some View {
        VStack {
            Spacer()
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to: ")
                Text("\(self.targetValue)")
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
                Text("Submit your prediction!")
            }
            .alert(isPresented: self.$isPushed){
                Alert(title: Text("Hello there"), message: Text(message), dismissButton: .default(Text("awesome")))
            }
            
            Spacer()
            // Score row
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start over")
                }
                Spacer()
                Text("Score: ")
                Text("80")
                Spacer()
                Text("Round: ")
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
    
    func calculateScoreValue() -> Int{
        var difference : Int
        if self.makeRoundSliderValue > self.targetValue{
            difference = self.makeRoundSliderValue - self.targetValue
        }
        else {
            difference = self.targetValue - self.makeRoundSliderValue
        }
        return 100 - difference
    }
}

// Preview
// =======

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
