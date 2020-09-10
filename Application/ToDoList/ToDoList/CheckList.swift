//
//  CheckList.swift
//  ToDoList
//
//  Created by Thao Nguyen on 9/10/20.
//  Copyright © 2020 Thao Nguyen. All rights reserved.
//

import Foundation

class CheckList: ObservableObject {
    @Published var checkListItems = [
        CheckListItem(name: "Walk the dog", isChecked: true),
        CheckListItem(name: "Brush my teeth"),
        CheckListItem(name: "Learn iOS development", isChecked: true),
        CheckListItem(name: "Soccer practice", isChecked: true),
        CheckListItem(name: "Eat ice cream", isChecked: true),
    ]
    
    
    func checkListContent(){
        for item in checkListItems{
            print(item)
        }
        // Delimiter
        print("====================")
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
