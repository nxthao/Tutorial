//
//  CheckListView.swift
//  ToDoList
//
//  Created by Thao Nguyen on 9/7/20.
//  Copyright © 2020 Thao Nguyen. All rights reserved.
//

import SwiftUI

struct CheckListView: View {
    
    // Properties
    // ==========
    
    @ObservedObject var checkList = CheckList()
    
    // User interface content and layout
    var body: some View {
        NavigationView{
            List{
                ForEach(checkList.checkListItems){ item in
                    HStack{
                        Text(item.name)
                        Spacer()
                        Text(item.isChecked ? "✅" : "🔲")
                    }
                    .background(Color.white) // This make the entire row clickable
                    .onTapGesture {
                        if let matchIndex = self.checkList.checkListItems.firstIndex(where: {$0.id == item.id}){
                            self.checkList.checkListItems[matchIndex].isChecked.toggle()
                        }
                        self.checkList.checkListContent()
                    }
                }
                .onMove(perform: checkList.moveListItem)
                .onDelete(perform: checkList.deleteListItem)
            }
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("To Do list")
            .onAppear(){
                self.checkList.checkListContent()
            }
        }
    }
    // Methods
    // ======
}

// Preview
// =======
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CheckListView()
    }
}
