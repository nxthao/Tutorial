//
//  SwiftUIView.swift
//  ToDoList
//
//  Created by Thao Nguyen on 9/17/20.
//  Copyright © 2020 Thao Nguyen. All rights reserved.
//
import SwiftUI

struct RowView: View {
    @State var checkListItem : CheckListItem
    
    var body: some View {
        NavigationLink(destination: EditCheckListItemView(checkListItem: $checkListItem)){
            HStack{
                Text(checkListItem.name)
                Spacer()
                Text(checkListItem.isChecked ? "✅" : "🔲")
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(checkListItem: CheckListItem(name: "sample"))
    }
}
