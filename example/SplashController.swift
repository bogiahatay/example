//
//  SplashController.swift
//  example
//
//  Created by Hà on 24/06/2023.
//

import UIKit
import Nuke
import ObjectMapper
import Alamofire

class SplashController: UIViewController {


    @IBOutlet var btnCallApi: UIView!

    @IBOutlet weak var imvImage: UIImageView!

    
    @IBOutlet weak var constraintHeight: NSLayoutConstraint!
    
    @IBOutlet weak var vExpand: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Nuke.loadImage(with: "https://icdn.24h.com.vn/upload/2-2023/images/2023-06-25/cxaaaaa-1687674586-517-width740height369.jpg", into: imvImage)
    }



    @IBAction func onClickApi(_ sender: Any) {

        if( self.constraintHeight.constant == 0){
            self.constraintHeight.constant = 200
        } else {
            self.constraintHeight.constant = 0
        }
        
//
        self.vExpand.setNeedsLayout()

        UIView.animate(withDuration: 1) {
            self.vExpand.superview?.layoutIfNeeded()
        }
 
        
//        var param: [String: String] = [:]
//
//        param["class_id"] = "9"
//
//        AF.request("https://gbt.iblankdigital.net/gbt/gbt.php/configs", method: .post, parameters: param)
//            .responseString { response in
//            switch response.result {
//            case .success:
//                if let data = response.data, let json = String(data: data, encoding: .utf8) {
//
//                    let configsResponse = ConfigsResponse(JSONString: json)!
//
//                    print("Successful")
//                    print(configsResponse.fanPageApp)
//
//
//
//                } else {
//                    print("falid 1")
//                }
//            default:
//                print("falid 2")
//            }
//        }
    }
}

class SubjectsResponse: Mappable {
    var arrData: Array<SubjectModel> = []

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        arrData <- map["arrData"]
    }
}

class SubjectModel: Mappable {

    var nameSubjects = ""
    var imageSubjects = ""
    var linkSubjects = ""

    var subjectMini: Array<SubjectMiniModel> = []

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        nameSubjects <- map["title"]
        imageSubjects <- map["image"]
        subjectMini <- map["subject_mini"]
    }

}

class SubjectMiniModel: Mappable {

    var nameSubjectMini = ""
    var imageSubjectMini = ""
    var linkSubjectMini = ""
    var boSach = ""


    var zipJson = ""
    var zipJsonFile = ""
    var zipJsonSize = ""
    var zipJsonTim = 0
    var zipJsonTimeStr = ""

    var zipImage = ""
    var zipImageFolder = ""
    var zipImageSize = 0
    var zipImageTime = 0
    var zipImageTimeStr = ""

    var offlineVersion = ""

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        nameSubjectMini <- map["title"]
        imageSubjectMini <- map["image"]
        linkSubjectMini <- map["link"]
        boSach <- map["bo_sach"]
        linkSubjectMini <- map["link"]
    }
}



class ConfigsResponse: Mappable {

    var fanPageMessenger = ""
    var fanPageApp = ""
    var fanPageWeb = ""

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        fanPageMessenger <- map["fanPageMessenger"]
        fanPageApp <- map["fanPageApp"]
        fanPageWeb <- map["fanPageWeb"]
    }
}

