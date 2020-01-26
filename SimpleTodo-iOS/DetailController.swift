//
//  DetailController.swift
//  SimpleTodo-iOS
//
//  Created by 佐々木 洋満 on 2020/01/26.
//  Copyright © 2020年 佐々木 洋満. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    @IBOutlet weak var TitleTextLabel: UILabel!
    @IBOutlet weak var DescriptionTextLabel: UILabel!
    
    var index: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if UserDefaults.standard.object(forKey: "TodoItems") != nil {
            TodoItems = UserDefaults.standard.object(forKey: "TodoItems") as! [Todo]
        }
        
        TitleTextLabel.text = TodoItems[index].getTitle()
        DescriptionTextLabel.text = TodoItems[index].getDescription()
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
