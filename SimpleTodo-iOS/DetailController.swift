//
//  DetailController.swift
//  SimpleTodo-iOS
//
//  Created by 佐々木 洋満 on 2020/01/26.
//  Copyright © 2020年 佐々木 洋満. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    
    var task: Task = Task(id: -1, title: "", description: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleTextLabel.text = task.title
        self.descriptionTextLabel.text = task.description
    }
    
    @IBAction func todoDeleteButton(_ sender: Any) {
        TaskClient().deleteTask(task: task, completionHander: {[weak self]
            (status) in
            if status == "SUCCESS" {
                DispatchQueue.main.async {
                    self?.performSegue(withIdentifier: "toViewControllerAfterDelete", sender: nil)
                }
            } else {
                print("deleting task failed")
            }
        })
    }
    @IBAction func todoEditButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toRegisterController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRegisterController" {
            let registerController = segue.destination as! RegisterController
            registerController.id = self.task.id
            registerController.originTitle = self.task.title
            registerController.originDescription = self.task.description
            registerController.isCreate = false
        }
    }
}
