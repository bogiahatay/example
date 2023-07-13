//
//  MySharedPreferences.swift
//  example
//
//  Created by Hà on 07/07/2023.
//

import UIKit
import ObjectMapper

class MySharedPreferences {
    
    //------------------- String -------------------
    static func putStringValue(_ key: String, _ value: String) {
        let user: UserDefaults = UserDefaults()
        user.set(value, forKey: key)
    }


    static func getStringValue(_ key: String) -> String {
        return getStringValue(key, "")
    }

    static func getStringValue(_ key: String, _ defaultValues: String) -> String {
        let user: UserDefaults = UserDefaults()
        if let value = user.string(forKey: key) {
            return value
        }
        return defaultValues
    }

    //------------------- Int -------------------
    static func putIntValue(_ key: String, _ value: Int) {
        putStringValue(key, String(value))
    }

    static func getIntValue(_ key: String) -> Int {
        return getIntValue(key, 0)
    }

    static func getIntValue(_ key: String, _ defaultValues: Int) -> Int {
        return Int(getStringValue(key, String(defaultValues)))!
    }

    //------------------- Bool -------------------
    static func putBooleanValue(_ key: String, _ value: Bool) {
        putStringValue(key, value ? "true" : "false")
    }

    static func getBooleanValue(_ key: String) -> Bool {
        return getBooleanValue(key, false)
    }

    static func getBooleanValue(_ key: String, _ defaultValues: Bool) -> Bool {
        return getStringValue(key, String(defaultValues)) == "true"
    }
    //------------------- Double -------------------
    static func putDoubleValue(_ key: String, _ value: Double) {
        putStringValue(key, String(value))
    }

    static func getDoubleValue(_ key: String) -> Double {
        return getDoubleValue(key, 0)
    }

    static func getDoubleValue(_ key: String, _ defaultValues: Double) -> Double {
        return Double(getStringValue(key, String(defaultValues)))!
    }

}
 
