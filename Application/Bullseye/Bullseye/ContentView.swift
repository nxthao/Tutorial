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
    
    // Color
    let midnightBlue = Color(red: 0, green: 0.2, blue: 0.4)
    
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
        abs(Int(makeRoundSliderValue) - targetValue)
    }
    
    // User interface content and layout
    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                // Target row
                HStack {
                    Text("Put the bullseye as close as you can to:")
                        .modifier(LabelStyle())
                    Text("\(targetValue)")
                        .modifier(ValueStyle())
                }
                
                Spacer()
                // Slider row
                HStack{
                    Text("1")
                        .modifier(LabelStyle())
                    Slider(value: $sliderValue, in: 1...100)
                        .accentColor(Color.green)
                    Text("100")
                        .modifier(ValueStyle())
                }
                
                Spacer()
                // Button row
                Button(action: {
                    print("Button is pushed")
                    self.isPushed = true
                }) {
                    Text("Submit!")
                        .modifier(ButtonLargeTextStyle())
                }
                .background(Image("Button"))
                .shadow(color: Color.black, radius: 3, x: 2, y: 2)
                    
                .alert(isPresented: $isPushed){
                    Alert(title: Text(alertTitle()), message: Text(message), dismissButton: .default(Text("Awesome!")){
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
                        HStack{
                            Image("StartOverIcon")
                            Text("Start over")
                                .modifier(ButtonSmallTextStyle())
                        }
                    }
                    .background(Image("Button"))
                    .shadow(color: Color.black, radius: 3, x: 2, y: 2)
                    
                    Spacer()
                    Text("Score: ")
                        .modifier(LabelStyle())
                    Text("\(score)")
                        .modifier(ValueStyle())
                    Spacer()
                    Text("Round: ")
                        .modifier(LabelStyle())
                    Text("\(round)")
                        .modifier(ValueStyle())
                    Spacer()
                    NavigationLink(destination: AboutView()) {
                        HStack{
                            Image("InfoIcon")
                            Text("info")
                                .modifier(ButtonSmallTextStyle())
                        }
                    }
                    .background(Image("Button"))
                    .shadow(color: Color.black, radius: 3, x: 2, y: 2)
                }
            }
            .padding(.all, 30)
            .accentColor(midnightBlue)
            .onAppear(){
                self.startNewGame()
            }
            .background(Image("Background"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
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
        score = 100
        round = 1
        resetSliderTarget()
    }
    
    func startNewRound(){
        score += pointForCurrentRound()
        round += 1
        resetSliderTarget()
    }
    
    func resetSliderTarget(){
        targetValue = Int.random(in: 1...100)
        sliderValue = Double.random(in: 1...100)
    }
}

// View modifier
struct LabelStyle : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
            .foregroundColor(Color.white)
            .shadow(color: Color.black, radius: 3, x: 2, y: 2)
    }
}

struct ValueStyle : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 24))
            .foregroundColor(Color.yellow)
            .shadow(color: Color.black, radius: 3, x: 2, y: 2)
    }
}

struct ButtonLargeTextStyle : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
            .foregroundColor(Color.yellow)
    }
}

struct ButtonSmallTextStyle : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font((Font.custom("Arial Rounded MT Bold", size: 12)))
            .foregroundColor(Color.yellow)
    }
}
// Preview
// =======

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
