//
//  ViewController.swift
//  example
//
//  Created by Hà on 22/06/2023.
//

import UIKit
import AVKit

class OneController: UIViewController {

    
    @IBOutlet weak var btnOne: UIButton!
    
    let arrData:Array<People> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData();
        
    }
    
    
    func initData(){
        
//        arrData = getData();
        /// set dât vào colection
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let people = arrData[indexPath.row]
        
        let cell = SubjectHolder()
        
        cell.people = people
        cell.mSelf = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrData.count
    }
    
    
    
    @IBAction func onClickOne(_ sender: Any) {
        
        let people = People()
        people.name = "Iam iron man"
        people.age = "18 year old"
        
        
        print("name : " + people.name)
        
        let storyboard = UIStoryboard(name: "Second", bundle: nil)
        let secondController = storyboard.instantiateViewController(withIdentifier: "Second") as! SecondController
        
        secondController.people = people
        
        let controller = UINavigationController(rootViewController: secondController)
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .fullScreen
        
        self.present(controller, animated: true, completion: nil)
        
    }
}


class SubjectHolder : UICollectionViewCell {
    
    var mSelf: UIViewController!

    var imvAvatar: UIImageView!
    var people: People!

//    override func onCreate() {
//        imvAvatar.setOnClickListener {
//            SecondController.start(self.mSelf, self.people)
//        }
//    }
}
