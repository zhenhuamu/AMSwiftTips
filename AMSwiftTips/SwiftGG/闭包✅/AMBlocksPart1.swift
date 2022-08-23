//
//  AMBlocksPart1.swift
//  AMSwiftTips
//
//  Created by AndyMu on 2020/10/14.
//

import Foundation
import UIKit

class AMBlocksPart1 {
    func setup() {
        point()
        point1()
        point2()
        point3()
        point4()
        point5()
    }
    
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    let numbers = [1, 3000, 400, 20, 3, 50, 45, 2]
    // MARK: 1.1 =========================== 排序方法
    func point() {
        /*
         Swift 标准库提供了名为 sorted(by:) 的方法，
         它会基于你提供的排序闭包表达式的判断结果对数组中的值（类型确定）进行排序。
         一旦它完成排序过程，sorted(by:) 方法会返回一个与旧数组类型大小相同类型的新数组，
         该数组的元素有着正确的排序顺序。
         原数组不会被 sorted(by:) 方法修改。
         */
        func backward(_ s1: String, _ s2: String) -> Bool {
            return s1 > s2
        }
        let reversedNames = names.sorted(by: backward)
        // reversedNames 为 ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
        print(names)
        print(reversedNames)
    }
    
    // MARK: 1.2 =========================== 闭包表达式语法
    func point1() {
        // 闭包表达式语法有如下的一般形式：
//        { (parameters) -> return type in
//            statements
//        }
        _ = {(s1:Int, s2:Int) -> Bool in
            return s1 > s2
        }
        /* 闭包表达式参数 可以是 inout 参数，但不能设定默认值。
        如果你命名了可变参数，也可以使用此可变参数。元组也可以作为参数和返回值。*/
        
        // 下面的例子展示了之前 backward(_:_:) 函数对应的闭包表达式版本的代码
        let temp = names.sorted(by: { (s1: String, s2: String) -> Bool in
            return s1 > s2
        })
        print(temp)
    }
    
    // MARK: 1.3 =========================== 根据上下文推断类型
    func point2() {
        /*因为排序闭包函数是作为 sorted(by:) 方法的参数传入的，Swift 可以推断其参数和返回值的类型。
         sorted(by:) 方法被一个字符串数组调用，因此其参数必须是 (String, String) -> Bool 类型的函数。
         这意味着 (String, String) 和 Bool 类型并不需要作为闭包表达式定义的一部分。
         因为所有的类型都可以被正确推断，返回箭头（->）和围绕在参数周围的括号也可以被省略：*/
        let temp = names.sorted(by: { s1, s2 in return s1 > s2 } )
        print(temp)
        /* 尽管如此，你仍然可以明确写出有着完整格式的闭包。
         如果完整格式的闭包能够提高代码的可读性，则我们更鼓励采用完整格式的闭包。*/
    }
    
    // MARK: 1.4 =========================== 单表达式闭包的隐式返回
    func point3() {
        // 单行表达式闭包可以通过省略 return 关键字来隐式返回单行表达式的结果，如上版本的例子可以改写为：
        let temp = names.sorted(by: { s1, s2 in s1 > s2 } )
        print(temp)
    }
    
    // MARK: 1.5 =========================== 参数名称缩写
    func point4() {
        /* Swift 自动为内联闭包提供了参数名称缩写功能，
         你可以直接通过 $0，$1，$2 来顺序调用闭包的参数，以此类推。
         如果你在闭包表达式中使用参数名称缩写，你可以在闭包定义中省略参数列表，
         并且对应参数名称缩写的类型会通过函数类型进行推断。
         in 关键字也同样可以被省略，因为此时闭包表达式完全由闭包函数体构成：*/
        let temp = names.sorted(by: { $0 > $1 } )
        print(temp)
    }
    
    // MARK: 1.6 =========================== 运算符方法
    func point5() {
        /* 实际上还有一种更简短的方式来编写上面例子中的闭包表达式。
         Swift 的 String 类型定义了关于大于号（>）的字符串实现，其作为一个函数接受两个 String 类型的参数并返回 Bool 类型的值。
         而这正好与 sorted(by:) 方法的参数需要的函数类型相符合。
         因此，你可以简单地传递一个大于号，Swift 可以自动推断找到系统自带的那个字符串函数的实现：*/
        let temp = names.sorted(by: >)
        print(temp)
        
        let temp1 = numbers.sorted(by: >)
        print(temp1)
        
    }

}
