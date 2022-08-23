//
//  AMEnumPart1.swift
//  AMSwiftTips
//
//  Created by AndyMu on 2020/10/23.
//

import Foundation

class AMEnumPart1 {

    enum CompassPoint {
        case north
        case south
        case east
        case west
    }
    
    func setup() {
        point()
        point1()
        point2()
        point3()
        point4()
    }
    
    // MARK: 1.1 =========================== 枚举语法
    func point() {
        print("=========================== 枚举语法")
        /* 注意
        与 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。
        在上面的 CompassPoint 例子中，north，south，east 和 west 不会被隐式地赋值为 0，1，2 和 3。
        相反，这些枚举成员本身就是完备的值，这些值的类型是已经明确定义好的 CompassPoint 类型。*/
        enum Planet {
            case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
        }
        // 使用
        var directionToHead = CompassPoint.west
        /* directionToHead 的类型可以在它被 CompassPoint 的某个值初始化时推断出来。
        一旦 directionToHead 被声明为 CompassPoint 类型，你可以使用更简短的点语法将其设置为另一个
        CompassPoint 的值：*/
        directionToHead = .east
        print(directionToHead)
    }
    
    // MARK: 1.2 =========================== 使用 Switch 语句匹配枚举值
    func point1() {
        print("=========================== 使用 Switch 语句匹配枚举值")
        let directionToHead = CompassPoint.south
        switch directionToHead {
        case .north:
            print("Lots of planets have a north")
        case .south:
            print("Watch out for penguins")
        case .east:
            print("Where the sun rises")
        case .west:
            print("Where the skies are blue")
        }
        // 打印“Watch out for penguins”
        
        /*
        正如在 控制流 中介绍的那样，在判断一个枚举类型的值时，switch 语句必须穷举所有情况。
        如果忽略了 .west 这种情况，上面那段代码将无法通过编译，因为它没有考虑到 CompassPoint
        的全部成员。强制穷举确保了枚举成员不会被意外遗漏。
         */
    }
    
    // MARK: 1.3 =========================== 枚举成员的遍历
    func point2() {
        print("=========================== 枚举成员的遍历")
        // 令枚举遵循 CaseIterable 协议。Swift 会生成一个 allCases 属性，用于表示一个包含枚举所有成员的集合。下面是一个例子：
        enum Beverage: CaseIterable {
            case coffee, tea, juice
        }
        let numberOfChoices = Beverage.allCases.count
        print("\(numberOfChoices) beverages available")
        // 打印“3 beverages available”
        
        for beverage in Beverage.allCases {
            print(beverage)
        }
        // coffee
        // tea
        // juice
    }
    
    // MARK: 1.4 =========================== 关联值
    func point3() {
        print("=========================== 关联值")
        /* 你可以定义Swift枚举来存储任意类型的关联值，如果需要的话，每个枚举成员的关联值类型可以各不相同。
         枚举的这种特性跟其他语言中的可识别联合（discriminated unions），标签联合（tagged
         unions），或者变体（variants）相似。*/
        enum Barcode {
            case upc(Int, Int, Int, Int)
            case qrCode(String)
        }
        // “定义一个名为 Barcode 的枚举类型，它的一个成员值是具有 (Int，Int，Int，Int) 类型关联值的 upc，另一个成员值是具有 String 类型关联值的 qrCode。”
        
        var productBarcode = Barcode.upc(8, 85909, 51226, 3)
        
        productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
        
        switch productBarcode {
        case let .upc(numberSystem, manufacturer, product, check):
            print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
        case let .qrCode(productCode):
            print("QR code: \(productCode).")
        }
        // 打印“QR code: ABCDEFGHIJKLMNOP.”
        
    }
    
    // MARK: 1.5 =========================== 原始值
    func point4() {
        print("=========================== 原始值")
        // 原始值的隐式赋值
        enum ASCIIControlCharacter: Character {
            case tab = "\t"
            case lineFeed = "\n"
            case carriageReturn = "\r"
        }
        /*枚举类型 ASCIIControlCharacter 的原始值类型被定义为 Character，
        并设置了一些比较常见的 ASCII 控制字符。Character 的描述详见 字符串和字符 部分。
        原始值可以是字符串、字符，或者任意整型值或浮点型值。每个原始值在枚举声明中必须是唯一的。*/
        
        enum Planet: Int {
            case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
        }
        // 在上面的例子中，Plant.mercury 的显式原始值为 1，Planet.venus 的隐式原始值为 2，依次类推。
    
        enum CompassPoint: String {
            case north, south, east, west
        }
        // 上面例子中，CompassPoint.south 拥有隐式原始值 south，依次类推。
        
        // 使用枚举成员的 rawValue 属性可以访问该枚举成员的原始值：
        let earthsOrder = Planet.earth.rawValue
        print(earthsOrder)
        // earthsOrder 值为 3

        let sunsetDirection = CompassPoint.west.rawValue
        print(sunsetDirection)
        // sunsetDirection 值为 "west"
        
        // 使用原始值初始化枚举实例
        let possiblePlanet = Planet(rawValue: 7)
        print(possiblePlanet ?? 0)
        // possiblePlanet 类型为 Planet? 值为 Planet.uranus
        /* 然而，并非所有 Int 值都可以找到一个匹配的行星。因此，原始值构造器总是返回一个可选的枚举成员。
        在上面的例子中，possiblePlanet 是 Planet? 类型，或者说“可选的 Planet”。*/
        
        let positionToFind = 11
        if let somePlanet = Planet(rawValue: positionToFind) {
            switch somePlanet {
            case .earth:
                print("Mostly harmless")
            default:
                print("Not a safe place for humans")
            }
        } else {
            print("There isn't a planet at position \(positionToFind)")
        }
        // 打印“There isn't a planet at position 11”
    }
    
    // MARK: 1.6 =========================== 递归枚举
    func point5() {
        
    }
    
    
    
}
