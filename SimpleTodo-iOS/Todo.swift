//
//  Todo.swift
//  SimpleTodo-iOS
//
//  Created by 佐々木 洋満 on 2020/01/26.
//  Copyright © 2020年 佐々木 洋満. All rights reserved.
//

import Foundation

class Todo {
    var id: Int
    var title: String
    var description: String
    
    init(id: Int, title: String, description: String) {
        self.id = id
        self.title = title
        self.description = description
    }
}
