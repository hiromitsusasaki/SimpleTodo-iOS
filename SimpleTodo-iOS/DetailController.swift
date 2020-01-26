//
//  DetailController.swift
//  SimpleTodo-iOS
//
//  Created by 佐々木 洋満 on 2020/01/26.
//  Copyright © 2020年 佐々木 洋満. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    @IBOutlet weak var TitleText: UILabel!
    @IBOutlet weak var DescriptionText: UILabel!
    
    var todoItem: Todo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TitleText.text = todoItem?.getTitle()
        DescriptionText.text = todoItem?.getDescription()
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
