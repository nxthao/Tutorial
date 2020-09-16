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
    @State var newCheckListItemViewIsVisible = false
    
    // User interface content and layout
    var body: some View {
        NavigationView{
            List{
                ForEach(checkList.items){ item in
                    HStack{
                        Text(item.name)
                        Spacer()
                        Text(item.isChecked ? "✅" : "🔲")
                    }
                    .background(Color.white) // This make the entire row clickable
                    .onTapGesture {
                        if let matchIndex = self.checkList.items.firstIndex(where: {$0.id == item.id}){
                            self.checkList.items[matchIndex].isChecked.toggle()
                        }
                        self.checkList.checkListContent()
                    }
                }
                .onMove(perform: checkList.moveListItem)
                .onDelete(perform: checkList.deleteListItem)
            }
            .navigationBarItems(
                leading:Button(action: {self.newCheckListItemViewIsVisible = true}) {
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("Add item")
                    }
                },
                trailing: EditButton()
            )
            .navigationBarTitle("To Do list")
            .onAppear(){
                self.checkList.checkListContent()
            }
        }
        .sheet(isPresented: $newCheckListItemViewIsVisible){
            NewCheckListItemView(checkList: self.checkList)
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
