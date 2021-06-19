//
//  AMIfPart1.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/19.
//

import Foundation

class AMIfPart1 {
    func SetupTest() {
        Test()
        Test1()
        Test2()
        Test3()
    }

    // MARK: 1.1 =========================== For-In 循环
    func Test() {
        
        // 数组
        let names = ["Anna", "Alex", "Brian", "Jack"]
        for name in names {
            print("Hello, \(name)!")
        }
        // Hello, Anna!
        // Hello, Alex!
        // Hello, Brian!
        // Hello, Jack!
        
        // 字典
        let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
        for (animalName, legCount) in numberOfLegs {
            print("\(animalName)s have \(legCount) legs")
        }
        // cats have 4 legs
        // ants have 6 legs
        // spiders have 8 legs
        
        // 使用数字范围
        for index in 1...5 {
            print("\(index) times 5 is \(index * 5)")
        }
        // 1 times 5 is 5
        // 2 times 5 is 10
        // 3 times 5 is 15
        // 4 times 5 is 20
        // 5 times 5 is 25
        
        // 本例中，是 3 的 10 次幂
        // 如果你不需要区间序列内每一项的值，你可以使用下划线（_）替代变量名来忽略这个值：
        let base = 3
        let power = 10
        var answer = 1
        for _ in 1...power {
            answer *= base
        }
        print("\(base) to the power of \(power) is \(answer)")
        // 输出“3 to the power of 10 is 59049”
        
        let minuteInterval = 5
        let endMinutes = 55
        for tickMark in stride(from: 0, to: endMinutes, by: minuteInterval) {
            // 每5分钟渲染一个刻度线（0, 5, 10, 15 ... 45, 50, 55）
            print(tickMark)
        }
        
        // 可以在闭区间使用 stride(from:through:by:) 起到同样作用：
        let hours = 12
        let hourInterval = 3
        for tickMark in stride(from: 3, through: hours, by: hourInterval) {
            // 每3小时渲染一个刻度线（3, 6, 9, 12）
            print(tickMark)
        }
    }
    
    // MARK: 1.2 =========================== While 循环
    func Test1() {
        // While 循环
        let finalSquare = 25
        var board = [Int](repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
        
        var square = 0
        var diceRoll = 0
        while square < finalSquare {
            // 掷骰子
            diceRoll += 1
            if diceRoll == 7 { diceRoll = 1 }
            // 根据点数移动
            square += diceRoll
            if square < board.count {
                // 如果玩家还在棋盘上，顺着梯子爬上去或者顺着蛇滑下去
                square += board[square]
            }
        }
        print("Game over!")
        
        // Repeat-While
        
        let finalSquare1 = 25
        var board1 = [Int](repeating: 0, count: finalSquare1 + 1)
        board1[03] = +08; board1[06] = +11; board1[09] = +09; board1[10] = +02
        board1[14] = -10; board1[19] = -11; board1[22] = -02; board1[24] = -08
        var square1 = 0
        var diceRoll1 = 0
        
        repeat {
            // 顺着梯子爬上去或者顺着蛇滑下去
            square1 += board1[square1]
            // 掷骰子
            diceRoll1 += 1
            if diceRoll1 == 7 { diceRoll1 = 1 }
            // 根据点数移动
            square1 += diceRoll1
        } while square1 < finalSquare1
        print("Game over!")
    }
    
    // MARK: 1.3 =========================== 条件语句 If
    func Test2() {
        // If
        var temperatureInFahrenheit = 30
        if temperatureInFahrenheit <= 32 {
            print("It's very cold. Consider wearing a scarf.")
        }
        // 输出“It's very cold. Consider wearing a scarf.”
        
        temperatureInFahrenheit = 40
        if temperatureInFahrenheit <= 32 {
        } else {
            print("It's not that cold. Wear a t-shirt.")
        }
        // 输出“It's not that cold. Wear a t-shirt.”
        
        temperatureInFahrenheit = 90
        if temperatureInFahrenheit <= 32 {
        } else if temperatureInFahrenheit >= 86 {
            print("It's really warm. Don't forget to wear sunscreen.")
        } else {
        }
        // 输出“It's really warm. Don't forget to wear sunscreen.”
    }
    
    // MARK: 1.4 =========================== 条件语句 switch
    func Test3() {
        let someCharacter: Character = "z"
        switch someCharacter {
        case "a":
            print("The first letter of the alphabet")
        case "z":
            print("The last letter of the alphabet")
        default:
            print("Some other character")
        }
        // 输出“The last letter of the alphabet”
        
//        let anotherCharacter: Character = "a"
//        switch anotherCharacter {
//        case "a": // 无效，这个分支下面没有语句
//        case "A":
//            print("The letter A")
//        default:
//            print("Not the letter A")
//        }
        // 这段代码会报编译错误
        
        let anotherCharacter: Character = "a"
        switch anotherCharacter {
        case "a", "A":
            print("The letter A")
        default:
            print("Not the letter A")
        }
        // 输出“The letter A”
        
        let approximateCount = 5
        let countedThings = "moons orbiting Saturn"
        let naturalCount: String
        switch approximateCount {
        case -10..<0:
            naturalCount = "no"
        case 1..<5:
            naturalCount = "a few"
        case 5..<12:
            naturalCount = "several"
        case 12..<100:
            naturalCount = "dozens of"
        case 100..<1000:
            naturalCount = "hundreds of"
        default:
            naturalCount = "many"
        }
        print("There are \(naturalCount) \(countedThings).")
        // 输出“There are dozens of moons orbiting Saturn.”
        
        let somePoint = (1, 1)
        switch somePoint {
        case (0, 0):
            print("\(somePoint) is at the origin")
        case (_, 0):
            print("\(somePoint) is on the x-axis")
        case (0, _):
            print("\(somePoint) is on the y-axis")
        case (-2...2, -2...2):
            print("\(somePoint) is inside the box")
        default:
            print("\(somePoint) is outside of the box")
        }
        // 输出“(1, 1) is inside the box”
        
        /* case 分支允许将匹配的值声明为临时常量或变量，
        并且在 case 分支体内使用 —— 这种行为被称为值绑定（value binding），
        因为匹配的值在 case 分支体内，与临时的常量或变量绑定。*/
        let anotherPoint = (2, 0)
        switch anotherPoint {
        case (let x, 0):
            print("on the x-axis with an x value of \(x)")
        case (0, let y):
            print("on the y-axis with a y value of \(y)")
        case let (x, y):
            print("somewhere else at (\(x), \(y))")
        }
        // 输出“on the x-axis with an x value of 2”
        
        let yetAnotherPoint = (1, -1)
        switch yetAnotherPoint {
        case let (x, y) where x == y:
            print("(\(x), \(y)) is on the line x == y")
        case let (x, y) where x == -y:
            print("(\(x), \(y)) is on the line x == -y")
        case let (x, y):
            print("(\(x), \(y)) is just some arbitrary point")
        }
        // 输出“(1, -1) is on the line x == -y”
        
        let someCharacter1: Character = "e"
        switch someCharacter1 {
        case "a", "e", "i", "o", "u":
            print("\(someCharacter1) is a vowel")
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
             "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            print("\(someCharacter1) is a consonant")
        default:
            print("\(someCharacter1) is not a vowel or a consonant")
        }
        // 输出“e is a vowel”
        
        let stillAnotherPoint = (9, 0)
        switch stillAnotherPoint {
        case (let distance, 0), (0, let distance):
            print("On an axis, \(distance) from the origin")
        default:
            print("Not on an axis")
        }
        // 输出“On an axis, 9 from the origin”
    }
    
    
    
    
}
