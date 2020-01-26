//
//  AddController.swift
//  SimpleTodo-iOS
//
//  Created by 佐々木 洋満 on 2020/01/18.
//  Copyright © 2020年 佐々木 洋満. All rights reserved.
//

import UIKit

var TodoItems = [Todo]()

class AddController: UIViewController {


    @IBOutlet weak var TodoTitleField: UITextField!
    @IBOutlet weak var TodoDescriptionField: UITextField!
    

    @IBAction func TodoRegisterButton(_ sender: Any) {
        let todo = Todo(title: TodoTitleField.text!, description: TodoDescriptionField.text!)
        TodoItems.append(todo)
        
        TodoTitleField.text = ""
        TodoDescriptionField.text = ""
        do {
            let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: TodoItems, requiringSecureCoding: true)
            UserDefaults.standard.set( encodedData, forKey: "TodoItems")
        } catch let error as NSError {
            print(error)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
