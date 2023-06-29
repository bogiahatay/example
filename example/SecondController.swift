//
//  SecondController.swift
//  example
//
//  Created by Hà on 23/06/2023.
//

import UIKit

class SecondController: UIViewController, UIGestureRecognizerDelegate {
    
    //Đây là code vào main
    static func start(_ mSelf: UIViewController,_ people: People){

        let storyboard = UIStoryboard(name: "Second", bundle: nil)
        let secondController = storyboard.instantiateViewController(withIdentifier: "Second") as! SecondController
        
        secondController.people = people
        
        let controller = UINavigationController(rootViewController: secondController)
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .fullScreen
        
        mSelf.present(controller, animated: true, completion: nil)
    }

    
    @IBOutlet weak var btnTest: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnGoto: UIButton!
    
    
    @IBOutlet weak var btnImage: UIImageView!
    @IBOutlet weak var vView: UIView!
    
    
    var people: People!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnTest.text = people.name
        
        
        
        self.navigationController?.hidesBottomBarWhenPushed = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    
        vView.setOnClickListener {
            print("vView.setOnClickListener")
        }
        
        btnImage.setOnClickListener {
            print("btnImage.setOnClickListener")
        }
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
    
    //đi tất cả màn hình
    @IBAction func onClickGoto(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Three", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Three") as! ThreeController
        
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
     
}
 

class People{
    var name = ""
    var age = ""
}
