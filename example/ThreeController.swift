//
//  ThreeController.swift
//  example
//
//  Created by Hà on 23/06/2023.
//

import UIKit

class ThreeController: UIViewController {
    
    @IBOutlet weak var btnBack: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onClickBack(_ sender: Any) {
        if let navigationController = self.navigationController {
            let stack = navigationController.viewControllers.count
            if stack > 1 {
                self.navigationController!.popViewController(animated: true)
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
}


