//
//  Todo.swift
//  SimpleTodo-iOS
//
//  Created by 佐々木 洋満 on 2020/01/26.
//  Copyright © 2020年 佐々木 洋満. All rights reserved.
//

import Foundation

class Todo {
    var mTitle: String
    var mDescription: String
    
    init(title: String, description:String) {
        mTitle = title
        mDescription = description
    }
    
    func getTitle() -> String {
        return mTitle
    }
    
    func getDescription() -> String {
        return mDescription
    }
}
