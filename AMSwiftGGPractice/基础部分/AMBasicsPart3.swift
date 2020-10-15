//
//  AMBasicsPart3.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/12.
//

import Foundation

class AMBasicsPart3 {
    func SetupTest() {
        Test()
        Test1()
        Test2()
    }
    ///-----------------------------元组-----------------------------///
    func Test() {
        // 元组（tuples）把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求是相同类型。
        let http404Error = (404, "Not Found")
        // http404Error 的类型是 (Int, String)，值是 (404, "Not Found")
        
        // 你可以将一个元组的内容分解（decompose）成单独的常量和变量，然后你就可以正常使用它们了：
        let (statusCode, statusMessage) = http404Error
        print("The status code is \(statusCode)")
        // 输出“The status code is 404”
        print("The status message is \(statusMessage)")
        // 输出“The status message is Not Found”
        
        // 如果你只需要一部分元组值，分解的时候可以把要忽略的部分用下划线（_）标记：
        let (justTheStatusCode, _) = http404Error
        print("The status code is \(justTheStatusCode)")
        // 输出“The status code is 404”
        
        // 你还可以通过下标来访问元组中的单个元素，下标从零开始：
        print("The status code is \(http404Error.0)")
        // 输出“The status code is 404”
        print("The status message is \(http404Error.1)")
        // 输出“The status message is Not Found”
        
        // 你可以在定义元组的时候给单个元素命名：
        let http200Status = (statusCode: 200, description: "OK")
        // 给元组中的元素命名后，你可以通过名字来获取这些元素的值：
        print("The status code is \(http200Status.statusCode)")
        // 输出“The status code is 200”
        print("The status message is \(http200Status.description)")
        // 输出“The status message is OK”
    }
    ///-------------------可选类型 & if 语句以及强制解析 ---------------------///
    func Test1() {
        let possibleNumber = "123"
        let convertedNumber = Int(possibleNumber)
        // convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"
        print(convertedNumber!)
        
        // 你可以给可选变量赋值为 nil 来表示它没有值：
        var serverResponseCode: Int? = 404
        // serverResponseCode 包含一个可选的 Int 值 404
        serverResponseCode = nil
        // serverResponseCode 现在不包含值
        print(serverResponseCode ?? "")
        
        /* nil 不能用于非可选的常量和变量。
        如果你的代码中有常量或者变量需要处理值缺失的情况，请把它们声明成对应的可选类型。*/
        
        /* Swift 的 nil 和 Objective-C 中的 nil 并不一样。
        在 Objective-C 中，nil 是一个指向不存在对象的指针。
        在 Swift 中，nil 不是指针——它是一个确定的值，用来表示值缺失。
        任何类型的可选状态都可以被设置为 nil，不只是对象类型。*/
        
        // 如果可选类型有值，它将不等于 nil：
        if convertedNumber != nil {
            print("convertedNumber contains some integer value.")
        }
        /* 当你确定可选类型确实包含值之后，你可以在可选的名字后面加一个感叹号（!）来获取值。
         这个惊叹号表示“我知道这个可选有值，请使用它。”这被称为可选值的强制解析（forced unwrapping）：*/
        if convertedNumber != nil {
            print("convertedNumber has an integer value of \(convertedNumber!).")
        }
        // 输出“convertedNumber has an integer value of 123.”
    }
    
    ///------------------------可选绑定------------------------------///
    func Test2() {
        let possibleNumber = "100"
        
        if let actualNumber = Int(possibleNumber) {
            print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
        } else {
            print("\'\(possibleNumber)\' could not be converted to an integer")
        }
        // 输出“'123' has an integer value of 123”
        
        /* 你可以包含多个可选绑定或多个布尔条件在一个 if 语句中，只要使用逗号分开就行。
         只要有任意一个可选绑定的值为 nil，或者任意一个布尔条件为 false，则整个 if 条件判断为 false。*/
        if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
        // 输出“4 < 42 < 100”

        if let firstNumber = Int("4") {
            if let secondNumber = Int("42") {
                if firstNumber < secondNumber && secondNumber < 100 {
                    print("\(firstNumber) < \(secondNumber) < 100")
                }
            }
        }
        // 输出“4 < 42 < 100”
    }
    
}
