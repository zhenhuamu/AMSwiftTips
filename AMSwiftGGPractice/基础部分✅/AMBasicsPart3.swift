//
//  AMBasicsPart3.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/12.
//

import Foundation

class AMBasicsPart3 {
    func SetupTest() {
        
        Point1()
        Point2()
        Point3()
        Point4()
        Point5()
        Point6()
    }
    
    // MARK: 1.11 =========================== 元组
    func Point1() {
        print("=========================== 元组")
        /// 元组（tuples）把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求是相同类型。
        /// http404Error 的类型是 (Int, String)，值是 (404, "Not Found")
        let http404Error = (404, "Not Found")
        
        /// 你可以将一个元组的内容分解（decompose）成单独的常量和变量，然后你就可以正常使用它们了：
        let (statusCode, statusMessage) = http404Error
        /// 输出“The status code is 404”
        print("The status code is \(statusCode)")
        /// 输出“The status message is Not Found”
        print("The status message is \(statusMessage)")
        
        /// 如果你只需要一部分元组值，分解的时候可以把要忽略的部分用下划线（_）标记：
        let (justTheStatusCode, _) = http404Error
        /// 输出“The status code is 404”
        print("The status code is \(justTheStatusCode)")
        
        /// 你还可以通过下标来访问元组中的单个元素，下标从零开始：
        /// 输出“The status code is 404”
        print("The status code is \(http404Error.0)")
        /// 输出“The status message is Not Found”
        print("The status message is \(http404Error.1)")
        
        /// 你可以在定义元组的时候给单个元素命名：
        let http200Status = (statusCode: 200, description: "OK")
        /// 给元组中的元素命名后，你可以通过名字来获取这些元素的值：
        /// 输出“The status code is 200”
        print("The status code is \(http200Status.statusCode)")
        /// 输出“The status message is OK”
        print("The status message is \(http200Status.description)")
    }
    
    // MARK: 1.12 =========================== 可选类型
    func Point2() {
        print("=========================== 可选类型")
        /// 原始的可选项定义
        let x:Optional = 10
        print("\(x)")
        /// 输出结果: Optional(10),提示这是一个可选值
        
        let possibleNumber = "123"
        let convertedNumber = Int(possibleNumber)
        /// convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"
        print(convertedNumber!)
        
        /// 定义常量，let的可选项没有默认值
        let _:Int?
        /// 定义变量，var的可选项默认值为nil
        var temp:Int?
        print("\(temp)")
    }
    
    // FIXME:⚠️⚠️⚠️可选类型
    /// C 和 Objective-C 中并没有可选类型这个概念。
    /// 最接近的是 Objective-C 中的一个特性，一个方法要不返回一个对象要不返回 nil，
    /// nil 表示“缺少一个合法的对象”。
    /// 然而，这只对对象起作用——对于结构体，基本的 C 类型或者枚举类型不起作用。
    /// 对于这些类型，Objective-C 方法一般会返回一个特殊值（比如 NSNotFound）来暗示值缺失。
    /// 这种方法假设方法的调用者知道并记得对特殊值进行判断。
    /// 然而，Swift 的可选类型可以让你暗示任意类型的值缺失，并不需要一个特殊值。
    
    /// 最常见的错误
    /// Fatal error: Unexpectedly found nil while unwrapping an Optional value
    /// 在解包的时候发现了 nil 值
    /// 定义可选项使用 “?”，并且使用强制解包 "!"
    
    
    // MARK: 1.12.1 =========================== nil
    func Point3() {
        print("=========================== nil")
        /// 你可以给可选变量赋值为 nil 来表示它没有值：
        var serverResponseCode: Int? = 404
        /// serverResponseCode 包含一个可选的 Int 值 404
        serverResponseCode = nil
        /// serverResponseCode 现在不包含值
        print(serverResponseCode ?? "")
        
        /// nil 不能用于非可选的常量和变量，如果你的代码中有常量或者变量需要处理值缺失的情况，
        /// 请把它们声明成对应的可选类型
        
        /// _ 被自动设置为 nil
        var _: String?
    }
    // FIXME:⚠️⚠️⚠️ nil
    /// Swift 的 nil 和 Objective-C 中的 nil 并不一样。
    /// 在 Objective-C 中，nil 是一个指向不存在对象的指针。
    /// 在 Swift 中，nil 不是指针——它是一个确定的值，用来表示值缺失。
    /// 任何类型的可选状态都可以被设置为 nil，不只是对象类型。
    
    // MARK: 1.12.2 =========================== if 语句以及强制解析
    func Point4() {
        print("=========================== if 语句以及强制解析")
        let possibleNumber = "123"
        let convertedNumber = Int(possibleNumber)
        /// 如果可选类型有值，它将不等于 nil：
        if convertedNumber != nil {
            print("convertedNumber contains some integer value.")
        }
        /// 当你确定可选类型确实包含值之后，你可以在可选的名字后面加一个感叹号（!）来获取值。
        /// 这个惊叹号表示“我知道这个可选有值，请使用它。”这被称为可选值的强制解析（forced unwrapping）：*/
        if convertedNumber != nil {
            /// 输出“convertedNumber has an integer value of 123.”
            print("convertedNumber has an integer value of \(convertedNumber!).")
        }
    }
    
    // MARK: 1.12.3 =========================== 可选绑定
    
    /// 使用可选绑定（optional binding）来判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量。
    /// 可选绑定可以用在 if 和 while语句中，这条语句不仅可以用来判断可选类型中是否有值，
    /// 同时可以将可选类型中的值赋给一个常量或者变量。
    /// if 和 while 语句，请参考 控制流。
    
    func Point5() {
        print("=========================== 可选绑定")
        let possibleNumber = "100"
        /// 输出“'123' has an integer value of 123”
        if let actualNumber = Int(possibleNumber) {
            print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
        } else {
            print("\'\(possibleNumber)\' could not be converted to an integer")
        }
        
        /// 你可以包含多个可选绑定或多个布尔条件在一个 if 语句中，只要使用逗号分开就行。
        /// 只要有任意一个可选绑定的值为 nil，或者任意一个布尔条件为 false，则整个 if 条件判断为 false。
        /// 输出“4 < 42 < 100”
        if let firstNumber = Int("4"),
           let secondNumber = Int("42"),
           firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
        
        /// 输出“4 < 42 < 100”
        if let firstNumber = Int("4") {
            if let secondNumber = Int("42") {
                if firstNumber < secondNumber && secondNumber < 100 {
                    print("\(firstNumber) < \(secondNumber) < 100")
                }
            }
        }
    }
    
    // MARK: 1.12.4 =========================== 隐式解析可选类型
    func Point6() {
        print("=========================== 隐式解析可选类型")
        /// 普通可选类型
        let possibleString: String? = "An optional string."
        let forcedString: String = possibleString! // 需要感叹号来获取值
        print(forcedString)
        
        ///隐式解析可选类型例子
        let assumedString: String! = "An implicitly unwrapped optional string."
        let implicitString: String = assumedString  // 不需要感叹号
        print(implicitString)
        
        
        /// 如果你在隐式解析可选类型没有值的时候尝试取值，会触发运行时错误。
        /// 和你在没有值的普通可选类型后面加一个惊叹号一样。
        
        //FIXME:⚠️⚠️⚠️ 隐式解析可选类型
        /// 如果一个变量之后可能变成 nil 的话请不要使用隐式解析可选类型。
        /// 如果你需要在变量的生命周期中判断是否是 nil 的话，请使用普通可选类型。
    }
    
}
