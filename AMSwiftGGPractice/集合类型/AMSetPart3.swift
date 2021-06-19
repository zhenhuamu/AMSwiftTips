//
//  AMSetPart3.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/15.
//

import Foundation

class AMSetPart3 {
    func SetupTest() {
        Test()
        Test1()
    }
    
    // MARK: 1.1 =========================== 字典
    func Test() {
        // 创建一个空字典
        var namesOfIntegers = [Int: String]()
        // namesOfIntegers 是一个空的 [Int: String] 字典
        
        namesOfIntegers[16] = "sixteen"
        // namesOfIntegers 现在包含一个键值对
        namesOfIntegers = [:]
        // namesOfIntegers 又成为了一个 [Int: String] 类型的空字典
        
        // 用字典字面量创建字典
        var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
        // 简化写法
        _ = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
        
        // 访问和修改字典
        print("The dictionary of airports contains \(airports.count) items.")
        // 打印“The dictionary of airports contains 2 items.”（这个字典有两个数据项）
        
        if airports.isEmpty {
            print("The airports dictionary is empty.")
        } else {
            print("The airports dictionary is not empty.")
        }
        // 打印“The airports dictionary is not empty.”
        
        airports["LHR"] = "London"
        // airports 字典现在有三个数据项
        
        /*updateValue(_:forKey:) 方法会返回对应值类型的可选类型。
        举例来说：对于存储 String 值的字典，这个函数会返回一个 String? 或者“可选 String”类型的值。
        如果有值存在于更新前，则这个可选值包含了旧值，否则它将会是 nil ：*/
        if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
            print("The old value for DUB was \(oldValue).")
        }
        // 输出“The old value for DUB was Dublin.”
        
        if let airportName = airports["DUB"] {
            print("The name of the airport is \(airportName).")
        } else {
            print("That airport is not in the airports dictionary.")
        }
        // 打印“The name of the airport is Dublin Airport.”
        
        airports["APL"] = "Apple Internation"
        // “Apple Internation”不是真的 APL 机场，删除它
        airports["APL"] = nil
        // APL 现在被移除了
        
        if let removedValue = airports.removeValue(forKey: "DUB") {
            print("The removed airport's name is \(removedValue).")
        } else {
            print("The airports dictionary does not contain a value for DUB.")
        }
        // 打印“The removed airport's name is Dublin Airport.”
    }
    
    // MARK: 1.2 =========================== 字典遍历
    func Test1() {
        let airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
        for (airportCode, airportName) in airports {
            print("\(airportCode): \(airportName)")
        }
        // YYZ: Toronto Pearson
        // LHR: London Heathrow
        
        for airportCode in airports.keys {
            print("Airport code: \(airportCode)")
        }
        // Airport code: YYZ
        // Airport code: LHR

        for airportName in airports.values {
            print("Airport name: \(airportName)")
        }
        // Airport name: Toronto Pearson
        // Airport name: London Heathrow
        
        _ = [String](airports.keys)
        // airportCodes 是 ["YYZ", "LHR"]

        _ = [String](airports.values)
        // airportNames 是 ["Toronto Pearson", "London Heathrow"]
        
    }
    
}
