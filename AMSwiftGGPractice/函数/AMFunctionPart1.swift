//
//  AMFunctionPart1.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/14.
//

import Foundation

class AMFunctionPart1: NSObject {
    func SetupTest() {
        Test()
    }
    ///------------------------函数 & 函数参数与返回值--------------------------///
    /* 函数是一段完成特定任务的独立代码片段。
    你可以通过给函数命名来标识某个函数的功能，
    这个名字可以被用来在需要的时候“调用”这个函数来完成它的任务。*/
    
    //函数的定义与调用
    /*当你定义一个函数时，你可以定义一个或多个有名字和类型的值，作为函数的输入，称为参数，
     也可以定义某种类型的值作为函数执行结束时的输出，称为返回类型。*/
    func Test() {
        func greet(person: String) -> String {
            let greeting = "Hello, " + person + "!"
            return greeting
        }
        
        func greetAgain(person: String) -> String {
            return "Hello again, " + person + "!"
        }
        print(greetAgain(person: "Anna"))
        // 打印“Hello again, Anna!”
        
        // 无参数函数
        func sayHelloWorld() -> String {
            return "hello, world"
        }

        // 多参数函数
        func greet(person: String, alreadyGreeted: Bool) -> String {
            if alreadyGreeted {
                return greetAgain(person: person)
            } else {
                return greet(person: person)
            }
        }
        print(greet(person: "Tim", alreadyGreeted: true))
        // 打印“Hello again, Tim!”
        
        // 无返回值函数
        func greet1(person: String) {
            print("Hello, \(person)!")
        }
        greet1(person: "Dave")
        // 打印“Hello, Dave!”
        
        /*返回值可以被忽略，但定义了有返回值的函数必须返回一个值，
         如果在函数定义底部没有返回任何值，将导致编译时错误。*/
        
        // 多重返回值函数
        func minMax(array: [Int]) -> (min: Int, max: Int) {
            var currentMin = array[0]
            var currentMax = array[0]
            for value in array[1..<array.count] {
                if value < currentMin {
                    currentMin = value
                } else if value > currentMax {
                    currentMax = value
                }
            }
            return (currentMin, currentMax)
        }
        /* 因为元组的成员值已被命名，因此可以通过 . 语法来检索找到的最小值与最大值：*/
        let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
        print("min is \(bounds.min) and max is \(bounds.max)")
        // 打印“min is -6 and max is 109”
        
        // 可选元组返回类型
        /* 可选元组类型如 (Int, Int)? 与元组包含可选类型如 (Int?, Int?) 是不同的。可选的元组类型，整个元组是可选的，而不只是元组中的每个元素值。*/
        func minMax1(array: [Int]) -> (min: Int, max: Int)? {
            if array.isEmpty { return nil }
            var currentMin = array[0]
            var currentMax = array[0]
            for value in array[1..<array.count] {
                if value < currentMin {
                    currentMin = value
                } else if value > currentMax {
                    currentMax = value
                }
            }
            return (currentMin, currentMax)
        }
        if let bounds = minMax1(array: [8, -6, 2, 109, 3, 71]) {
            print("min is \(bounds.min) and max is \(bounds.max)")
        }
        // 打印“min is -6 and max is 109”
        
        // 隐式返回的函数
        func greeting(for person: String) -> String {
            "Hello, " + person + "!"
        }
        print(greeting(for: "Dave"))
        // 打印 "Hello, Dave!"

        func anotherGreeting(for person: String) -> String {
            return "Hello, " + person + "!"
        }
        print(anotherGreeting(for: "Dave"))
        // 打印 "Hello, Dave!"
        // 任何一个可以被写成一行 return 语句的函数都可以忽略 return。
    }
    
}
