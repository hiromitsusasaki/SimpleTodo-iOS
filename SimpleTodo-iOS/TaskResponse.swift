//
//  TaskResponse.swift
//  SimpleTodo-iOS
//
//  Created by 佐々木 洋満 on 2020/01/28.
//  Copyright © 2020年 佐々木 洋満. All rights reserved.
//

import Foundation
import Foundation

struct Task: Codable {
    let id: Int
    let title: String
    let description: String
}

struct TaskResponse: Decodable {
    let data: [Task]
}
