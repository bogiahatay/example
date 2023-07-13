//
//  ViewController.swift
//  example
//
//  Created by Hà on 22/06/2023.
//

import UIKit
import AVKit
import SwiftEventBus

class MessageBus{
    var abc = ""
}

class OneController: UIViewController {

    let MAIN = "Main"
    let USER = "User"
    let SUBJECT = "Subject"
    let LESSON = "Lesson"
    let EXERCISE = "Exercise"

    @IBOutlet weak var vMain: UIView!

    @IBOutlet weak var btnTab2: UIButton!

    @IBOutlet weak var btnTab1: UIButton!
    @IBOutlet weak var vEx: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnTab1.setOnClickListener {
//            self.onClickTab(self.MAIN, false)
            let event = MessageBus()
            event.abc = "456"
            SwiftEventBus.post("KEY_BUS", sender: event)
        }

        btnTab2.setOnClickListener {
            self.onClickTab(self.USER, false)
        }
        
//        vEx.conner = 10
        vEx.layer.cornerRadius = 10
        
        
        
        SwiftEventBus.onMainThread(self, name: "KEY_BUS") { result in
            // UI thread
            let event = result!.object as! MessageBus
            print("msg " + event.abc)
            
        }
        
    }

    var fragmentHome: SecondController? = nil
    var fragmentUser: ThreeController? = nil

    func onClickTab(_ tag: String, _ isBack: Bool) {

        print("onClickTab " + tag)
        
        var selectedFragment: UIViewController? = nil

        switch (tag) {
        case MAIN:
            if (fragmentHome == nil) {
                let storyboard = UIStoryboard(name: "Second", bundle: nil)
                fragmentHome = storyboard.instantiateViewController(withIdentifier: "Second") as? SecondController
                fragmentHome!.mSelf = self
                vMain.addView(fragmentHome!.view!)
            }
            selectedFragment = fragmentHome
            break
        case USER:
            if (fragmentUser == nil) {
                let storyboard = UIStoryboard(name: "Three", bundle: nil)
                fragmentUser = storyboard.instantiateViewController(withIdentifier: "Three") as? ThreeController
                vMain.addView(fragmentUser!.view!)
            }
            selectedFragment = fragmentUser
            break
        default:
            break

        }
        
        
        fragmentHome?.view.isHidden = true
        fragmentHome?.view.isUserInteractionEnabled = false
        
        fragmentUser?.view.isHidden = true
        fragmentUser?.view.isUserInteractionEnabled = false

        selectedFragment?.view.isHidden = false
        selectedFragment?.view.isUserInteractionEnabled = true

    }

}


class SubjectHolder: UICollectionViewCell {

    var mSelf: UIViewController!

    var imvAvatar: UIImageView!
    var people: People!

//    override func onCreate() {
//        imvAvatar.setOnClickListener {
//            SecondController.start(self.mSelf, self.people)
//        }
//    }
}
