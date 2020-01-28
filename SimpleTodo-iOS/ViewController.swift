//
//  ViewController.swift
//  SimpleTodo-iOS
//
//  Created by 佐々木 洋満 on 2020/01/18.
//  Copyright © 2020年 佐々木 洋満. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tasks: [Task]?
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks?.count ?? -1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        TodoCell.textLabel!.text = tasks?[indexPath.row].title
        return TodoCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        if let detailController = storyboard?.instantiateViewController(withIdentifier: "DetailController") as? DetailController {
            detailController.task = tasks?[index] ?? Task(id: -1, title: "", description: "")
            navigationController?.pushViewController(detailController, animated: true)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TaskClient().fetchTasks {[weak self] (tasks) in
            self?.tasks = tasks
            DispatchQueue.main.async {
                self?.tableView?.reloadData()
            }
        }
    }


}

