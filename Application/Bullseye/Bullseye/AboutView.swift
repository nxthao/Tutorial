//
//  AboutView.swift
//  Bullseye
//
//  Created by Thao Nguyen on 9/5/20.
//  Copyright © 2020 Thao Nguyen. All rights reserved.
//

import SwiftUI

// Constants
let beige = Color(red: 1.0, green: 0.84, blue: 0.7)

// AboutView
struct AboutView: View {
    var body: some View {
        Group{
            VStack{
                Text("🎯 Bullseye 🎯")
                    .modifier(HeadingStyle())
                Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider.")
                    .modifier(BodyStyle())
                    .lineLimit(nil)
                Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.")
                    .modifier(BodyStyle())
                    .lineLimit(nil)
                Text("Enjoy!")
                    .modifier(BodyStyle())
                .navigationBarTitle("About bullseye")
            }
            .background(beige)
        }
        .background(Image("Background"))
    }
}

// View modifier
struct HeadingStyle : ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 30))
            .foregroundColor(Color.black)
            .padding(.top, 20)
            .padding(.bottom, 20)
    }
}

struct BodyStyle : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 16))
            .foregroundColor(Color.black)
            .padding(.leading, 60)
            .padding(.trailing, 60)
            .padding(.bottom, 20)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
