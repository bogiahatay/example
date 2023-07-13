//
//  ExArray.swift
//  example
//
//  Created by Hà on 07/07/2023.
//

import Foundation

extension Array {
    func randomItem() -> Element? {
        if isEmpty { return nil }
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }

//    func randomItem(_ number: Int) -> Array<Element> {
//        if (number >= count) {
//            return self
//        }
//        var array: Array<Element> = []
//        var arrIndex: Array<Int> = []
//
//        for _ in 1...number {
//            var index = 0
//            for _ in 0...100 {
//                index = Random.nextInt(count)
//                if (!arrIndex.contains(index)) {
//                    arrIndex.add(index)
//                    array.add(self.get(index))
//                    break
//                }
//            }
//        }
//        return array
//
//    }

    var length: Int {
        get { return count }
    }

    var size: Int {
        get { return count }
    }
    
    mutating func add(_ obj: Element) {
        append(obj)
    }

    func get(_ pos: Int) -> Element {
        return self[pos]
    }

//    mutating func add(_ obj: Element) {
//        append(obj)
//    }

    mutating func add(_ pos: Int, _ obj: Element) {
        insert(obj, at: pos)
    }

    mutating func remove(_ pos: Int) {
        remove(at: pos)
    }

//    func size() -> Int {
//        return count
//    }
//
    func isEmpty() -> Bool {
        return isEmpty
    }

//    func get(_ attribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint {
//        return (self as! Array<NSLayoutConstraint>).filter {
//            if $0.firstAttribute == attribute {
//                return true
//            }
//            return false
//        }.first!
//    }
//
//    func get2(_ value: CGFloat) -> NSLayoutConstraint {
//        return (self as! Array<NSLayoutConstraint>).filter {
//            if $0.constant == value {
//                log("con: \($0.constant)")
//                return true
//            }
//            return false
//        }.first!
//    }
}
