//
//  FetchTasksResponse.swift
//  SimpleTodo-iOS
//
//  Created by 佐々木 洋満 on 2020/01/29.
//  Copyright © 2020年 佐々木 洋満. All rights reserved.
//

import Foundation

struct FetchTasksResponse: Decodable {
    let data: [Task]
}
