//
//  ContentView.swift
//  ToDoList
//
//  Created by Thao Nguyen on 9/7/20.
//  Copyright © 2020 Thao Nguyen. All rights reserved.
//

import SwiftUI

struct CheckListItem : Identifiable{
    let id = UUID()
    var name : String
    var isChecked = false
}

struct ContentView: View {
    
    // Properties
    // ==========
    
    // User interface view
    @State var checkListItems = [
        CheckListItem(name: "Walk the dog", isChecked: true),
        CheckListItem(name: "Brush my teeth"),
        CheckListItem(name: "Learn iOS development", isChecked: true),
        CheckListItem(name: "Soccer practice", isChecked: true),
        CheckListItem(name: "Eat ice cream", isChecked: true),
    ]
    
    // User interface content and layout
    var body: some View {
        NavigationView{
            List{
                ForEach(checkListItems){ item in
                    HStack{
                        Text(item.name)
                        Spacer()
                        Text(item.isChecked ? "✅" : "🔲")
                    }
                    .background(Color.white)
                    .onTapGesture {
                        if let matchIndex = self.checkListItems.firstIndex(where: {$0.id == item.id}){
                            self.checkListItems[matchIndex].isChecked.toggle()
                        }
                        self.checkListContent()
                    }
                }
                .onMove(perform: moveListItem)
                .onDelete(perform: deleteListItem)
            }
            .navigationBarItems(trailing: EditButton())
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
    
    func deleteListItem(whichElement : IndexSet){
        checkListItems.remove(atOffsets : whichElement)
        checkListContent()
    }
    
    func moveListItem(whichElement : IndexSet, destination : Int) {
        checkListItems.move(fromOffsets: whichElement, toOffset: destination)
        checkListContent()
    }
}


// Preview
// =======
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
