//
//  ContentView.swift
//  ToDoList
//
//  Created by Thao Nguyen on 9/7/20.
//  Copyright © 2020 Thao Nguyen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // Properties
    // ==========
    
    // User interface view
    @State var checkListItems = [
        "Walk the dog",
        "Brush my teeth",
        "Learn iOS development",
        "Soccer practice",
        "Eat ice cream",
    ]
    
    // User interface content and layout
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("High priority")){
                    Text(checkListItems[0])
                        .onTapGesture {
                            self.checkListItems[0] = "Learn English"
                    }
                    Text(checkListItems[1])
                    Text(checkListItems[2])
                }
                Section(header: Text("Low priority")){
                    Text(checkListItems[3])
                    Text(checkListItems[4])
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("To Do list")
            .onAppear(){
                self.checkListContent()
            }
        }
    }
    
    // Methods
    // ======
    
    func checkListContent(){
        for item in checkListItems{
            print(item)
        }
    }
}

// Preview
// =======
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
