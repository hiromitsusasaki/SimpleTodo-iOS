//
//  TaskClient.swift
//  SimpleTodo-iOS
//
//  Created by 佐々木 洋満 on 2020/01/28.
//  Copyright © 2020年 佐々木 洋満. All rights reserved.
//

import Foundation

class TaskClient {
    let baseUrl = "http://localhost:3000/api/v1/tasks"
    
    func fetchTasks(completionHander: @escaping([Task]) -> Void) {
        
        let url = URL(string: baseUrl)!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching tasks: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print("Error with the response, unexpected status code: \(String(describing: response))")
                    return
            }
            if let data = data,
                let taskResponse = try? JSONDecoder().decode(TaskResponse.self, from: data) {
                completionHander(taskResponse.data)
            }
        })
        task.resume()
    }
}

