//
//  ViewController.swift
//  SimpleTodo-iOS
//
//  Created by 佐々木 洋満 on 2020/01/18.
//  Copyright © 2020年 佐々木 洋満. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        TodoCell.textLabel!.text = TodoItems[indexPath.row].getTitle()
        return TodoCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = TodoItems[indexPath.row]
        if let detailController = storyboard?.instantiateViewController(withIdentifier: "DetailController") as? DetailController {
            detailController.todoItem = selectedItem
            navigationController?.pushViewController(detailController, animated: true)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if UserDefaults.standard.object(forKey: "TodoItems") != nil {
            TodoItems = UserDefaults.standard.object(forKey: "TodoItems") as! [Todo]
        }
    }


}

