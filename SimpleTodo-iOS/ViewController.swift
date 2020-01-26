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
        TodoCell.textLabel!.text = TodoItems[indexPath.row]
        return TodoCell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            TodoItems = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        }
    }


}

