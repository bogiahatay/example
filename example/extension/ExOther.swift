//
//  ExOther.swift
//  example
//
//  Created by Hà on 13/07/2023.
//

import Foundation


func postDelay( _ time: Int, _ completion: @escaping () -> Void) {
    postDelay(Double(time), completion)
}


func postDelay( _ time: Double, _ completion: @escaping () -> Void) {
    if time <= 0 {
        completion()
    } else {
        let when = DispatchTime.now() + time / 1000
        DispatchQueue.main.asyncAfter(deadline: when) {
            completion()
        }
    }
}
