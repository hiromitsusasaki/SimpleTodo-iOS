//
//  AddController.swift
//  SimpleTodo-iOS
//
//  Created by 佐々木 洋満 on 2020/01/18.
//  Copyright © 2020年 佐々木 洋満. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var TodoTitleField: UITextField!
    @IBOutlet weak var TodoDescriptionField: UITextField!
    
    var id: Int = -1
    var originTitle: String = ""
    var originDescription: String = ""
    var isCreate: Bool = true
    
    @IBAction func TodoRegisterButton(_ sender: Any) {
        let task = Task(id: self.id, title: TodoTitleField.text!, description: TodoDescriptionField.text!)
        if (self.isCreate) {
            TaskClient().createTask(task: task, completionHander: {[weak self] (status) in
                if status == "SUCCESS" {
                    DispatchQueue.main.async {
                        self?.performSegue(withIdentifier: "toViewControllerAfterRegister", sender: nil)
                    }
                } else {
                    print("creating task failed")
                }
            })
        } else {
            TaskClient().updateTask(task: task, completionHander: {[weak self]
                (status) in
                if status == "SUCCESS" {
                    DispatchQueue.main.async {
                        self?.performSegue(withIdentifier: "toViewControllerAfterRegister", sender: nil)
                    }
                } else {
                    print("updating task failed")
                }
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (!isCreate) {
            print(self.id)
            TodoTitleField.text = originTitle
            TodoDescriptionField.text = originDescription
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
