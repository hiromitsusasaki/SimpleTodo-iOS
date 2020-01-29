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
        
        let fetchTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
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
                let fetchTasksResponse = try? JSONDecoder().decode(FetchTasksResponse.self, from: data) {
                completionHander(fetchTasksResponse.data)
            }
        })
        fetchTask.resume()
    }
    
    func createTask(task: Task, completionHander: @escaping(String) -> Void) {
        
        let url = URL(string: baseUrl)!
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            let payload = try JSONEncoder().encode(task)
            let createTask = URLSession.shared.uploadTask(with: request, from: payload, completionHandler: {
            (data, response, error) in
                if let error = error {
                    print("Error with creating task: \(error)")
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                    print("Error with the response, unexpected status code: \(String(describing: response))")
                    return
                }
                if let data = data,
                    let createTaskResponse = try?
                        JSONDecoder().decode(CreateTaskResponse.self, from: data) {
                    completionHander(createTaskResponse.status)
                }
            })
            createTask.resume()
        } catch {
            print(error)
        }
    }
    
    func updateTask(task: Task, completionHander: @escaping(String) -> Void) {
        
        let url = URL(string: baseUrl + "/" + String(task.id))!
        var request = URLRequest(url: url)
        
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            let payload = try JSONEncoder().encode(task)
            let updateTask = URLSession.shared.uploadTask(with: request, from: payload, completionHandler: {
                (data, response, error) in
                if let error = error {
                    print("Error with updating task: \(error)")
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                        print("Error with the response, unexpected status code: \(String(describing: response))")
                        return
                }
                if let data = data,
                    let updateTaskResponse = try?
                        JSONDecoder().decode(UpdateTaskResponse.self, from: data) {
                    completionHander(updateTaskResponse.status)
                }
            })
            updateTask.resume()
        } catch {
            print(error)
        }
    }
    
    func deleteTask(task: Task, completionHander: @escaping(String) -> Void) {
        
        let url = URL(string: baseUrl + "/" + String(task.id))!
        var request = URLRequest(url: url)
        
        request.httpMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            let payload = try JSONEncoder().encode(task)
            let deleteTask = URLSession.shared.uploadTask(with: request, from: payload, completionHandler: {
                (data, response, error) in
                if let error = error {
                    print("Error with deleting task: \(error)")
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                        print("Error with the response, unexpected status code: \(String(describing: response))")
                        return
                }
                if let data = data,
                    let deleteTaskResponse = try?
                        JSONDecoder().decode(DeleteTaskResponse.self, from: data) {
                    completionHander(deleteTaskResponse.status)
                }
            })
            deleteTask.resume()
        } catch {
            print(error)
        }
        
    }
}

