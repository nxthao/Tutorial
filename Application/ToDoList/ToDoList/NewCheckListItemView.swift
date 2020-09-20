//
//  NewCheckListItemView.swift
//  ToDoList
//
//  Created by Thao Nguyen on 9/16/20.
//  Copyright © 2020 Thao Nguyen. All rights reserved.
//

import SwiftUI

struct NewCheckListItemView: View {
    
    var checkList : CheckList
    @State var newItemName = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            Text("Add new item")
            Form{
                TextField("Enter item name", text: $newItemName)
                Button(action: {
                    let newCheckListItem = CheckListItem(name: self.newItemName)
                    self.checkList.items.append(newCheckListItem)
                    self.checkList.checkListContent()
                    self.checkList.saveListItems()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("Add item")
                    }
                }
                .disabled(newItemName.count == 0)
            }
            Text("Swipe down to cancel")
        }
    }
}

struct NewCheckListItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewCheckListItemView(checkList: CheckList())
    }
}
