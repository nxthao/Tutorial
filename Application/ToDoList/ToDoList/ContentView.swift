//
//  ContentView.swift
//  ToDoList
//
//  Created by Thao Nguyen on 9/7/20.
//  Copyright © 2020 Thao Nguyen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("High priority")){
                    Text("Walk the dog")
                    Text("Brush my teeth")
                    Text("Learn iOS development")
                }
                Section(header: Text("Low priority")){
                    Text("Soccer practice")
                    Text("Eat ice cream")
                }
            }
        .listStyle(GroupedListStyle())
            .navigationBarTitle("To Do list")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
