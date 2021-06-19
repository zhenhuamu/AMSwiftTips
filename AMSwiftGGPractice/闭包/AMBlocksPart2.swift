//
//  AMBlocksPart2.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/14.
//

import Foundation

class AMBlocksPart2 {
    func SetupTest() {
        Test()
        Test1()
        Test2()
        Test3()
    }
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    // MARK: 1.1 =========================== 尾随闭包
    /* 如果你需要将一个很长的闭包表达式作为最后一个参数传递给函数，
     将这个闭包替换成为尾随闭包的形式很有用。
     尾随闭包是一个书写在函数圆括号之后的闭包表达式，函数支持将其作为最后一个参数调用。
     在使用尾随闭包时，你不用写出它的参数标签：*/
    func Test() {
        func someFunctionThatTakesAClosure(closure: () -> Void) {
            // 函数体部分
        }
        
        // 以下是不使用尾随闭包进行函数调用
        someFunctionThatTakesAClosure(closure: {
            // 闭包主体部分
        })

        // 以下是使用尾随闭包进行函数调用
        someFunctionThatTakesAClosure() {
            // 闭包主体部分
        }
        
        // 在 闭包表达式语法 上章节中的字符串排序闭包可以作为尾随包的形式改写在 sorted(by:) 方法圆括号的外面：
        _ = names.sorted() { $0 > $1 }
        
        // 如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉
        _ = names.sorted { $0 > $1 }
        
        /* 当闭包非常长以至于不能在一行中进行书写时，尾随闭包变得非常有用。
        举例来说，Swift 的 Array 类型有一个 map(_:) 方法，这个方法获取一个闭包表达式作为其唯一参数。
        该闭包函数会为数组中的每一个元素调用一次，并返回该元素所映射的值。
        具体的映射方式和返回值类型由闭包来指定。*/
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        let numbers = [16, 58, 510]
        
        let strings = numbers.map {
            (number) -> String in
            var number = number
            var output = ""
            repeat {
                output = digitNames[number % 10]! + output
                number /= 10
            } while number > 0
            return output
        }
        // strings 常量被推断为字符串类型数组，即 [String]
        // 其值为 ["OneSix", "FiveEight", "FiveOneZero"]
        print(strings)
    }
    
    // MARK: 1.2 =========================== 值捕获
    func Test1() {
        /*闭包可以在其被定义的上下文中捕获常量或变量。
        即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。
        Swift 中，可以捕获值的闭包的最简单形式是嵌套函数，也就是定义在其他函数的函数体内的函数。
        嵌套函数可以捕获其外部函数所有的参数以及定义的常量和变量。*/
        func makeIncrementer(forIncrement amount: Int) -> () -> Int {
            var runningTotal = 0
            // 闭包
            func incrementer() -> Int {
                runningTotal += amount
                return runningTotal
            }
            return incrementer
        }
        /* incrementer() 函数并没有任何参数，但是在函数体内访问了 runningTotal 和 amount 变量。
        这是因为它从外围函数捕获了 runningTotal 和 amount 变量的引用。
        捕获引用保证了 runningTotal 和 amount 变量在调用完 makeIncrementer 后不会消失，
        并且保证了在下一次执行 incrementer 函数时，runningTotal 依旧存在。*/
        let incrementByTen = makeIncrementer(forIncrement: 10)
        print(incrementByTen())
        // 返回的值为10
        print(incrementByTen())
        // 返回的值为20
        print(incrementByTen())
        // 返回的值为30
        
        /*如果你将闭包赋值给一个类实例的属性，并且该闭包通过访问该实例或其成员而捕获了该实例，
        你将在闭包和该实例间创建一个循环强引用。Swift 使用捕获列表来打破这种循环强引用。
        更多信息，请参考 闭包引起的循环强引用。*/
    }
    
    // MARK: 1.3 =========================== 逃逸闭包
    /* 当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。
     当你定义接受闭包作为参数的函数时，你可以在参数名之前标注 @escaping，用来指明这个闭包是允许“逃逸”出这个函数的。*/
    
    /* 一种能使闭包“逃逸”出函数的方法是，将这个闭包保存在一个函数外部定义的变量中。
    举个例子，很多启动异步操作的函数接受一个闭包参数作为 completion handler。
    这类函数会在异步操作开始之后立刻返回，但是闭包直到异步操作结束后才会被调用。
    在这种情况下，闭包需要“逃逸”出函数，因为闭包需要在函数返回之后被调用。例如：*/
    var x = 10
    var completionHandlers: [() -> Void] = []
    func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
        completionHandlers.append(completionHandler)
    }
    
    func someFunctionWithNonescapingClosure(closure: () -> Void) {
        closure()
    }
    
    func Test2() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
        print(x)
        // 打印出“200”
        completionHandlers.first?()
        print(x)
        // 打印出“100”
    }
    
    // MARK: 1.4 =========================== 自动闭包
    /*
     自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。
     这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。
     这种便利语法让你能够省略闭包的花括号，用一个普通的表达式来代替显式的闭包。
     */
    func Test3() {
        var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        print(customersInLine.count)
        // 打印出“5”

        let customerProvider = { customersInLine.remove(at: 0) }
        print(customersInLine.count)
        // 打印出“5”

        print("Now serving \(customerProvider())!")
        // 打印出“Now serving Chris!”
        print(customersInLine.count)
        // 打印出“4”
        
        var customersInLine1 = ["Alex", "Ewa", "Barry", "Daniella"]
        func serve(customer customerProvider: () -> String) {
            print("Now serving \(customerProvider())!")
        }
        serve(customer: { customersInLine1.remove(at: 0) } )
        // 打印出“Now serving Alex!”
        
        /* 上面的 serve(customer:) 函数接受一个返回顾客名字的显式的闭包。
        下面这个版本的 serve(customer:) 完成了相同的操作，不过它并没有接受一个显式的闭包，
        而是通过将参数标记为 @autoclosure 来接收一个自动闭包。
        现在你可以将该函数当作接受 String 类型参数（而非闭包）的函数来调用。
        customerProvider 参数将自动转化为一个闭包，因为该参数被标记了 @autoclosure 特性。*/
        var customersInLine2 = ["Ewa", "Barry", "Daniella"]
        func serve1(customer customerProvider: @autoclosure () -> String) {
            print("Now serving \(customerProvider())!")
        }
        serve1(customer: customersInLine2.remove(at: 0))
        // 打印“Now serving Ewa!”
        
        // 如果你想让一个自动闭包可以“逃逸”，则应该同时使用 @autoclosure 和 @escaping 属性。@escaping 属性的讲解见上面的 逃逸闭包。
        var customersInLine3 = ["Barry", "Daniella"]
        var customerProviders: [() -> String] = []
        func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
            customerProviders.append(customerProvider)
        }
        collectCustomerProviders(customersInLine3.remove(at: 0))
        collectCustomerProviders(customersInLine3.remove(at: 0))

        print("Collected \(customerProviders.count) closures.")
        // 打印“Collected 2 closures.”
        for customerProvider in customerProviders {
            print("Now serving \(customerProvider())!")
        }
        // 打印“Now serving Barry!”
        // 打印“Now serving Daniella!”
        
    }
     
}


