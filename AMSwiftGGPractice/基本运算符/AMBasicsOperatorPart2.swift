//
//  AMBasicsOperatorPart2.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/13.
//

import Foundation

class AMBasicsOperatorPart2 {
    func SetupTest() {
        Point1()
        Point2()
        Point3()
    }
    
    // MARK: 1.1 =========================== 空合运算符
    /* 空合运算符（a ?? b）将对可选类型 a 进行空判断，如果 a 包含一个值就进行解包，否则就返回一个默认值 b。表达式 a 必须是 Optional 类型。默认值 b 的类型必须要和 a 存储值的类型保持一致。*/
    func Point1() {
        print("=========================== 空合运算符")
        let a:String? = ""
        let b = ""
        // 空合运算符是对以下代码的简短表达方法：
        let c = (a != nil ? a! : b)
        print(c)
        
        let defaultColorName = "red"
        var userDefinedColorName: String?
        userDefinedColorName = nil
        let colorNameToUse = userDefinedColorName ?? defaultColorName
        print(colorNameToUse)
    }
    
    // MARK: 1.2 =========================== 区间运算符
    func Point2() {
        print("=========================== 区间运算符")
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
        let a = range.contains(7)
        let b = range.contains(4)
        let c = range.contains(-1)
        print(a,b,c)
    }
    
    // MARK: 1.3 =========================== 逻辑运算符
    func Point3() {
        print("=========================== 逻辑运算符")
        let allowedEntry = false
        if !allowedEntry {
            print("ACCESS DENIED")
        }
        
        let enteredDoorCode = true
        let passedRetinaScan = false
        if enteredDoorCode && passedRetinaScan {
            print("Welcome!")
        } else {
            print("ACCESS DENIED")
        }
        
        let hasDoorKey = false
        let knowsOverridePassword = true
        if hasDoorKey || knowsOverridePassword {
            print("Welcome!")
        } else {
            print("ACCESS DENIED")
        }
        
        // 组合多个逻辑运算符来表达一个复合逻辑：
        if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
            print("Welcome!")
        } else {
            print("ACCESS DENIED")
        }
        
        if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
            print("Welcome!")
        } else {
            print("ACCESS DENIED")
        }
        //FIXME:⚠️⚠️⚠️ 逻辑运算符
        /*为了一个复杂表达式更容易读懂，在合适的地方使用括号来明确优先级是很有效的，虽然它并非必要的。
         在上个关于门的权限的例子中，我们给第一个部分加个括号，使它看起来逻辑更明确：*/
    }
    
}
