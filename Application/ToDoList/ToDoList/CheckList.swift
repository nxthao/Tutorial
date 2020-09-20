//
//  CheckList.swift
//  ToDoList
//
//  Created by Thao Nguyen on 9/10/20.
//  Copyright © 2020 Thao Nguyen. All rights reserved.
//

import Foundation

class CheckList: ObservableObject {
    // Properties
    // ==========
    @Published var items = [
        CheckListItem(name: "Walk the dog", isChecked: true),
        CheckListItem(name: "Brush my teeth"),
        CheckListItem(name: "Learn iOS development", isChecked: true),
        CheckListItem(name: "Soccer practice", isChecked: true),
        CheckListItem(name: "Eat ice cream", isChecked: true),
    ]
    
    // Method
    // ======
    init() {
        print("Document directory's path \(documentsDirectory())")
        print("Data file path \(dataFilePath())")
        loadItems()
    }
    
    func checkListContent(){
        for item in items{
            print(item)
        }
        // Delimiter
        print("====================")
    }
    
    func deleteListItem(whichElement : IndexSet){
        items.remove(atOffsets : whichElement)
        saveListItems()
        checkListContent()
    }
    
    func moveListItem(whichElement : IndexSet, destination : Int) {
        items.move(fromOffsets: whichElement, toOffset: destination)
        saveListItems()
        checkListContent()
    }
    
    func documentsDirectory() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL{
        return documentsDirectory().appendingPathComponent("CheckList.plist")
    }
    
    func saveListItems(){
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(items)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding items array: \(error.localizedDescription)")
        }
    }
    
    func loadItems() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path){
            let decoder = PropertyListDecoder()
            do {
                items = try decoder.decode([CheckListItem].self, from: data)
            } catch {
                print("Error decoding item array: \(error.localizedDescription)")
            }
        }
    }
}
