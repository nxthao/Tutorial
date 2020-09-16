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
    var body: some View {
        VStack{
            Text("Add new item")
            Form{
                TextField("Enter item name", text: $newItemName)
                Button(action: {
                    var newCheckListItem = CheckListItem(name: self.newItemName)
                    self.checkList.items.append(newCheckListItem)
                    self.checkList.checkListContent()
                }) {
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("Add item")
                    }
                }
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
