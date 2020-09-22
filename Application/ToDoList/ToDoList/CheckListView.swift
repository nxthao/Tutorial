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

    var body : some View{
        NavigationView{
            List{
                ForEach(checkList.items){ item in
                    RowView(checkListItem: item)
                        .background(Color.white) // This make the entire row clickable
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
                self.checkList.saveListItems()
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
