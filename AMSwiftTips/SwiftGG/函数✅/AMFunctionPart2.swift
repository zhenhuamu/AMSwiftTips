//
//  AMFunctionPart2.swift
//  AMSwiftTips
//
//  Created by AndyMu on 2020/10/14.
//

import Foundation

class AMFunctionPart2 {
    func setup() {
        point()
        point1()
    }
    // MARK: 1.1 =========================== 函数参数标签和参数名称
    func point() {
        print("=========================== 函数参数标签和参数名称")
        func someFunction(firstParameterName: Int, secondParameterName: Int) {
            // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
        }
        someFunction(firstParameterName: 1, secondParameterName: 2)
        
        // 指定参数标签
        func greet(person: String, from hometown: String) -> String {
            return "Hello \(person)!  Glad you could visit from \(hometown)."
        }
        print(greet(person: "Bill", from: "Cupertino"))
        // 打印“Hello Bill!  Glad you could visit from Cupertino.”
        
        // 忽略参数标签
        func someFunction1(_ firstParameterName: Int, secondParameterName: Int) {
             // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
        }
        someFunction1(1, secondParameterName: 2)
        
        // 默认参数值
        /*你可以在函数体中通过给参数赋值来为任意一个参数定义默认值（Deafult Value）。当默认值被定义后，调用这个函数时可以忽略这个参数*/
        func someFunction2(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
            // 如果你在调用时候不传第二个参数，parameterWithDefault 会值为 12 传入到函数体中。
        }
        someFunction2(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault = 6
        someFunction2(parameterWithoutDefault: 4) // parameterWithDefault = 12
        
        // 可变参数
        func arithmeticMean(_ numbers: Double...) -> Double {
            var total: Double = 0
            for number in numbers {
                total += number
            }
            return total / Double(numbers.count)
        }
        _ = arithmeticMean(1, 2, 3, 4, 5)
        // 返回 3.0, 是这 5 个数的平均数。
        _ = arithmeticMean(3, 8.25, 18.75)
        // 返回 10.0, 是这 3 个数的平均数。
        
        // 一个函数最多只能拥有一个可变参数。
        
        // 输入输出参数
        /* 你只能传递变量给输入输出参数。你不能传入常量或者字面量，因为这些量是不能被修改的。
        当传入的参数作为输入输出参数时，需要在参数名前加 & 符，表示这个值可以被函数修改。*/
        func swapTwoInts(_ a: inout Int, _ b: inout Int) {
            let temporaryA = a
            a = b
            b = temporaryA
        }
        var someInt = 3
        var anotherInt = 107
        swapTwoInts(&someInt, &anotherInt)
        print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
        // 打印“someInt is now 107, and anotherInt is now 3”
        
        /* 输入输出参数和返回值是不一样的。上面的 swapTwoInts 函数并没有定义任何返回值，但仍然修改了 someInt 和 anotherInt 的值。输入输出参数是函数对函数体外产生影响的另一种方式。*/
    }
    
    // MARK: 1.2 =========================== 函数类型
    func point1() {
        print("=========================== 函数类型")
        // 每个函数都有种特定的函数类型，函数的类型由函数的参数类型和返回类型组成。
        func addTwoInts(_ a: Int, _ b: Int) -> Int {
            return a + b
        }
        func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
            return a * b
        }
        // 这两个函数的类型是 (Int, Int) -> Int
        func printHelloWorld() {
            print("hello, world")
        }
        // 这个函数的类型是：() -> Void
        
        // 使用函数类型
        var mathFunction: (Int, Int) -> Int = addTwoInts
        print("Result: \(mathFunction(2, 3))")
        // Prints "Result: 5"
        
        // 有相同匹配类型的不同函数可以被赋值给同一个变量，就像非函数类型的变量一样
        mathFunction = multiplyTwoInts
        print("Result: \(mathFunction(2, 3))")
        // Prints "Result: 6"
        
        // 就像其他类型一样，当赋值一个函数给常量或变量时，你可以让 Swift 来推断其函数类型：
        _ = addTwoInts
        // anotherMathFunction 被推断为 (Int, Int) -> Int 类型
        
        // 函数类型作为参数类型
        func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
            print("Result: \(mathFunction(a, b))")
        }
        printMathResult(addTwoInts, 3, 5)
        // 打印“Result: 8”
        
        // 函数类型作为返回类型
        func stepForward(_ input: Int) -> Int {
            return input + 1
        }
        func stepBackward(_ input: Int) -> Int {
            return input - 1
        }
        
        func chooseStepFunction(backward: Bool) -> (Int) -> Int {
            return backward ? stepBackward : stepForward
        }
        
        var currentValue = 3
        let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
        // moveNearerToZero 现在指向 stepBackward() 函数。
        
        // Counting to zero:
        while currentValue != 0 {
            print("\(currentValue)... ")
            currentValue = moveNearerToZero(currentValue)
        }
        print("zero!")
        // 3...
        // 2...
        // 1...
        // zero!
    }
    
    // MARK: 1.3 =========================== 嵌套函数
    /* 到目前为止本章中你所见到的所有函数都叫全局函数（global functions），它们定义在全局域中。
     你也可以把函数定义在别的函数体中，称作 嵌套函数（nested functions）。*/
    func chooseStepFunction(backward: Bool) -> (Int) -> Int {
        func stepForward(input: Int) -> Int { return input + 1 }
        func stepBackward(input: Int) -> Int { return input - 1 }
        return backward ? stepBackward : stepForward
    }
    
}
