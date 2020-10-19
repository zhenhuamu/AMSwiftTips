//
//  AMIfPart2.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/19.
//

import Foundation

class AMIfPart2 {
    func SetupTest() {
        Test()
        Test1()
        Test2()
        Test3()
        Test4()
    }
    /*
     控制转移语句改变你代码的执行顺序，通过它可以实现代码的跳转。Swift 有五种控制转移语句：
     continue
     break
     fallthrough
     return
     throw
     */
    ///------------------------continue--------------------------///
    func Test() {
        /* continue 语句告诉一个循环体立刻停止本次循环，重新开始下次循环。
        就好像在说“本次循环我已经执行完了”，但是并不会离开整个循环体。*/
        let puzzleInput = "great minds think alike"
        var puzzleOutput = ""
        for character in puzzleInput {
            switch character {
            case "a", "e", "i", "o", "u", " ":
                continue
            default:
                puzzleOutput.append(character)
            }
        }
        print(puzzleOutput)
        // 输出“grtmndsthnklk”
    }
    ///------------------------break--------------------------///
    func Test1() {
        /* break 语句会立刻结束整个控制流的执行。
        break 可以在 switch 或循环语句中使用，用来提前结束 switch 或循环语句。*/
        let numberSymbol: Character = "三"  // 简体中文里的数字 3
        var possibleIntegerValue: Int?
        switch numberSymbol {
        case "1", "١", "一", "๑":
            possibleIntegerValue = 1
        case "2", "٢", "二", "๒":
            possibleIntegerValue = 2
        case "3", "٣", "三", "๓":
            possibleIntegerValue = 3
        case "4", "٤", "四", "๔":
            possibleIntegerValue = 4
        default:
            break
        }
        if let integerValue = possibleIntegerValue {
            print("The integer value of \(numberSymbol) is \(integerValue).")
        } else {
            print("An integer value could not be found for \(numberSymbol).")
        }
        // 输出“The integer value of 三 is 3.”
    }
    ///------------------------Fallthrough--------------------------///
    /* fallthrough 关键字不会检查它下一个将会落入执行的 case 中的匹配条件。fallthrough 简单地使代码继续连接到下一个 case 中的代码，这和 C 语言标准中的 switch 语句特性是一样的。*/
    func Test2() {
        let integerToDescribe = 5
        var description = "The number \(integerToDescribe) is"
        switch integerToDescribe {
        case 2, 3, 5, 7, 11, 13, 17, 19:
            description += " a prime number, and also"
            fallthrough
        default:
            description += " an integer."
        }
        print(description)
        // 输出“The number 5 is a prime number, and also an integer.”
    }
    ///------------------------带标签的语句--------------------------///

    ///------------------------提前退出--------------------------///
    /* 像 if 语句一样，guard 的执行取决于一个表达式的布尔值。
    我们可以使用 guard 语句来要求条件必须为真时，以执行 guard 语句后的代码。
    不同于 if 语句，一个 guard 语句总是有一个 else 从句，如果条件不为真则执行 else 从句中的代码。*/
    func Test3() {
        func greet(person: [String: String]) {
            guard let name = person["name"] else {
                return
            }

            print("Hello \(name)!")

            guard let location = person["location"] else {
                print("I hope the weather is nice near you.")
                return
            }

            print("I hope the weather is nice in \(location).")
        }

        greet(person: ["name": "John"])
        // 输出“Hello John!”
        // 输出“I hope the weather is nice near you.”
        greet(person: ["name": "Jane", "location": "Cupertino"])
        // 输出“Hello Jane!”
        // 输出“I hope the weather is nice in Cupertino.”
    }
    
    ///------------------------检测 API 可用性--------------------------///
    /* 我们在 if 或 guard 语句中使用 可用性条件（availability condition)去有条件的执行一段代码，
    来在运行时判断调用的 API 是否可用。编译器使用从可用性条件语句中获取的信息去验证，在这个代码块中调用的 API 是否可用。*/
    func Test4() {
        if #available(iOS 10, macOS 10.12, *) {
            // 在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API
        } else {
            // 使用先前版本的 iOS 和 macOS 的 API
        }
    }
    
    
}
