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
    @State var targetValue = Int.random(in: 1...100)
    var makeRoundSliderValue : Int{
        Int(sliderValue.rounded())
    }
    @State var score = 100 // Give every people 100 point when playing
    @State var round = 1
    
    // TODO: Compact the message in alert.
    var message : String{
        "Hello IOS developer from Thao Nguyen developer \n" +
            "The slider value: \(makeRoundSliderValue) \n" +
        "Your score: \(pointForCurrentRound())"
    }
    
    var sliderTargetDifference : Int{
        abs(Int(sliderValue) - targetValue)
    }
    
    // User interface content and layout
    var body: some View {
        VStack {
            Spacer()
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to: ").foregroundColor(.red)
                Text("\(targetValue)")
            }
            
            Spacer()
            // Slider row
            HStack{
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
            }
            
            Spacer()
            // Button row
            Button(action: {
                print("Button is pushed")
                self.isPushed = true
            }) {
                Text("Submit your prediction!").foregroundColor(.green)
            }
            .alert(isPresented: $isPushed){
                Alert(title: Text(alertTitle()), message: Text(message), dismissButton: .default(Text("awesome")){
                    self.startNewRound()
                    }
                )
            }
            
            Spacer()
            // Score row
            HStack {
                Button(action: {
                    self.startNewGame()
                }) {
                    Text("Start over")
                }
                Spacer()
                Text("Score: ").foregroundColor(.red)
                Text("\(score)")
                Spacer()
                Text("Round: ").foregroundColor(.red)
                Text("\(round)")
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
    
    func pointForCurrentRound() -> Int{
        var point : Int
        if sliderTargetDifference == 0{
            point = 100
        }
        else if sliderTargetDifference == 1{
            point = 50
        }
        else{
            point = -sliderTargetDifference
        }
        return point
    }
    
    func alertTitle() -> String{
        var title : String
        if sliderTargetDifference == 0{
            title = "Perfect!"
        }
        else if sliderTargetDifference <= 5{
            title = "You almost had it!"
        }
        else if sliderTargetDifference <= 10{
            title = "Not too bad."
        }
        else{
            title = "Are you even trying?"
        }
        return title
    }
    
    func startNewGame(){
        score = 0
        round = 0
        resetSliderTarget()
    }
    
    func startNewRound(){
        score += pointForCurrentRound()
        round += 1
        resetSliderTarget()
    }
    
    func resetSliderTarget(){
        targetValue = Int.random(in: 1...100)
        sliderValue = 50
    }
}

// Preview
// =======

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
