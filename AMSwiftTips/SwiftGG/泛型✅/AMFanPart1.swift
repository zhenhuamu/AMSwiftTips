//
//  AMFanPart1.swift
//  AMSwiftTips
//
//  Created by AndyMu on 2020/10/25.
//

import Foundation

class AMFanPart1 {

    func SetupTest() {
        Test()
        Test1()
    }
    
    // MARK: 1.1 =========================== 泛型解决的问题
    func Test() {
        func swapTwoInts(_ a: inout Int, _ b: inout Int) {
            let temporaryA = a
            a = b
            b = temporaryA
        }
        func swapTwoStrings(_ a: inout String, _ b: inout String) {
            let temporaryA = a
            a = b
            b = temporaryA
        }

        func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
            let temporaryA = a
            a = b
            b = temporaryA
        }
        
        /* 在实际应用中，通常需要一个更实用更灵活的函数来交换两个任意类型的值，
        幸运的是，泛型代码帮你解决了这种问题。（这些函数的泛型版本已经在下面定义好了。）*/
        
        /* 注意
        在上面三个函数中，a 和 b 类型必须相同。
        如果 a 和 b 类型不同，那它们俩就不能互换值。
        Swift 是类型安全的语言，所以它不允许一个 String 类型的变量和一个 Double 类型的变量互换值。
        试图这样做将导致编译错误。*/
    }
    
    // MARK: 1.2 =========================== 泛型函数
    func Test1() {
        func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
            let temporaryA = a
            a = b
            b = temporaryA
        }
        /* 泛型版本的函数使用占位符类型名（这里叫做 T ），
        而不是 实际类型名（例如 Int、String 或 Double），占位符类型名并不关心 T 具体的类型，
        但它要求 a 和b 必须是相同的类型，T 的实际类型由每次调用 swapTwoValues(_:_:) 来决定。*/
        
        /*
        泛型函数和非泛型函数的另外一个不同之处在于
        这个泛型函数名（swapTwoValues(_:_:)）后面跟着占位类型名（T），并用尖括号括起来（<T>）。
        这个尖括号告诉 Swift 那个 T 是 swapTwoValues(_:_:) 函数定义内的一个占位类型名，
        因此 Swift 不会去查找名为 T的实际类型。*/
        
        var someInt = 3
        var anotherInt = 107
        swapTwoValues(&someInt, &anotherInt)
        // someInt 现在是 107，anotherInt 现在是 3

        var someString = "hello"
        var anotherString = "world"
        swapTwoValues(&someString, &anotherString)
        // someString 现在是“world”，anotherString 现在是“hello”
    }
    
    // MARK: 1.3 =========================== 类型参数
    /*上面 swapTwoValues(_:_:)
    例子中，占位类型 T 是一个类型参数的例子，类型参数指定并命名一个占位类型，
    并且紧随在函数名后面，使用一对尖括号括起来（例如 <T>）。
    一旦一个类型参数被指定，你可以用它来定义一个函数的参数类型（例如 swapTwoValues(_:_:)
    函数中的参数 a 和 b），或者作为函数的返回类型，还可以用作函数主体中的注释类型。
    在这些情况下，类型参数会在函数调用时被实际类型所替换。
   （在上面的 swapTwoValues(_:_:) 例子中，当函数第一次被调用时，T 被 Int 替换，
    第二次调用时，被 String 替换。）
    你可提供多个类型参数，将它们都写在尖括号中，用逗号分开。*/
    
    // MARK: 1.4 =========================== 命名类型参数
    /*大多情况下，类型参数具有描述下的名称，
    例如字典 Dictionary<Key, Value> 中的 Key 和 Value 及数组 Array<Element> 中的 Element，
    这能告诉阅读代码的人这些参数类型与泛型类型或函数之间的关系。
    然而，当它们之间没有有意义的关系时，通常使用单个字符来表示，例如 T、U、V，例如上面演示函数 swapTwoValues(_:_:) 中的 T。
    注意
    请始终使用大写字母开头的驼峰命名法（例如 T 和 MyTypeParameter）来为类型参数命名，以表明它们是占位类型，而不是一个值。*/
    
    
    // MARK: 1.5 =========================== 泛型类型
    /* 除了泛型函数，Swift 还允许自定义泛型类型。
    这些自定义类、结构体和枚举可以适用于任意类型，类似于 Array 和 Dictionary。
    本节将向你展示如何编写一个名为 Stack（栈）的泛型集合类型。
    栈是值的有序集合，和数组类似，但比数组有更严格的操作限制。数组允许在其中任意位置插入或是删除元素。
    而栈只允许在集合的末端添加新的元素（称之为入栈）。类似的，栈也只能从末端移除元素（称之为出栈）。*/
    
    
}
