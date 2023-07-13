//
//  ExJson.swift
//  example
//
//  Created by Hà on 07/07/2023.
//

import Foundation
import UIKit
import ObjectMapper

extension BaseMappable {

    func toJson() -> String {
        return toJSONString() ?? "null"
    }

    func toJsonPretty() -> String {
        return toJSONString(prettyPrint: true) ?? "null"
    }
    
//    return Mapper<Story>().mapArray(JSONString: json)!

}

func log(_ tag: String, _ msg: String){
    print(tag + ": " + msg)
}

extension NSObject {

    func toJson() -> String {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            let jsonText = String(data: jsonData, encoding: .ascii)!
            return jsonText
        } catch {
            log("JSON","error convert to json")
            return ""
        }
    }
}



