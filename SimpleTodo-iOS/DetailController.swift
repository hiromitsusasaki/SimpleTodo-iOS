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
        
    }
    @IBAction func todoEditButton(_ sender: Any) {
        
    }
    
}
