//
//  AMBasicsOperatorPart2.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/13.
//

import Foundation

class AMBasicsOperatorPart2 {
    func SetupTest() {
        Test()
        Test1()
    }
    ///---------------------------空合运算符-----------------------------///
    /* 空合运算符（a ?? b）将对可选类型 a 进行空判断，如果 a 包含一个值就进行解包，否则就返回一个默认值 b。表达式 a 必须是 Optional 类型。默认值 b 的类型必须要和 a 存储值的类型保持一致。*/
    func Test() {
        let a:String? = ""
        let b = ""
        // 空合运算符是对以下代码的简短表达方法：
        _ = (a != nil ? a! : b)
        
        let defaultColorName = "red"
        var userDefinedColorName: String?   //默认值为 nil
        userDefinedColorName = nil
        let colorNameToUse = userDefinedColorName ?? defaultColorName
        // userDefinedColorName 的值为空，所以 colorNameToUse 的值为 "red"
        print(colorNameToUse)
    }
    
    ///---------------------------区间运算符-----------------------------///
    func Test1() {
        // 闭区间运算符
        for index in 1...5 {
            print("\(index) * 5 = \(index * 5)")
        }
        // 半开区间运算符
        let names = ["Anna", "Alex", "Brian", "Jack"]
        let count = names.count
        for i in 0..<count {
            print("第 \(i + 1) 个人叫 \(names[i])")
        }
        // 单侧区间
        for name in names[2...] {
            print(name)
        }
        for name in names[...2] {
            print(name)
        }
        for name in names[..<2] {
            print(name)
        }
        
        // 查看一个单侧区间是否包含某个特定的值
        let range = ...5
        _ = range.contains(7)   // false
        _ = range.contains(4)   // true
        _ = range.contains(-1)  // true
    }
    
    ///---------------------------逻辑运算符-----------------------------///
    /* 逻辑非（!a）
    逻辑与（a && b）
    逻辑或（a || b）*/
    func Test2() {
        let allowedEntry = false
        if !allowedEntry {
            print("ACCESS DENIED")
        }
        // 输出“ACCESS DENIED”
        
        let enteredDoorCode = true
        let passedRetinaScan = false
        if enteredDoorCode && passedRetinaScan {
            print("Welcome!")
        } else {
            print("ACCESS DENIED")
        }
        // 输出“ACCESS DENIED”
        
        let hasDoorKey = false
        let knowsOverridePassword = true
        if hasDoorKey || knowsOverridePassword {
            print("Welcome!")
        } else {
            print("ACCESS DENIED")
        }
        // 输出“Welcome!”
        
        // 组合多个逻辑运算符来表达一个复合逻辑：
        if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
            print("Welcome!")
        } else {
            print("ACCESS DENIED")
        }
        // 输出“Welcome!”
        
        /*为了一个复杂表达式更容易读懂，在合适的地方使用括号来明确优先级是很有效的，虽然它并非必要的。
         在上个关于门的权限的例子中，我们给第一个部分加个括号，使它看起来逻辑更明确：*/
        if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
            print("Welcome!")
        } else {
            print("ACCESS DENIED")
        }
        // 输出“Welcome!”
    }
    
}
