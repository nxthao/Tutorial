//
//  EditCheckListItemView.swift
//  ToDoList
//
//  Created by Thao Nguyen on 9/12/20.
//  Copyright © 2020 Thao Nguyen. All rights reserved.
//

import SwiftUI

struct EditCheckListItemView: View {
    @Binding var checkListItem : CheckListItem
    var body: some View {
        Form{
            TextField("name", text: $checkListItem.name)
            Toggle("complete", isOn: $checkListItem.isChecked)
        }
    }
}

struct EditCheckListItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditCheckListItemView(checkListItem: .constant(CheckListItem(name: "sample")))
    }
}
