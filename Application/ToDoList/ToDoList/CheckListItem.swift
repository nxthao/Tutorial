//
//  CheckListItem.swift
//  ToDoList
//
//  Created by Thao Nguyen on 9/10/20.
//  Copyright © 2020 Thao Nguyen. All rights reserved.
//

import Foundation

struct CheckListItem : Identifiable, Codable{
    let id = UUID()
    var name : String
    var isChecked = false
}
