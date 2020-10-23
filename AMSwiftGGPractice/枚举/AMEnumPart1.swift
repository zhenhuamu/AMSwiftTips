//
//  AMEnumPart1.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/23.
//

import Foundation

class AMEnumPart1 {
    /*
    枚举为一组相关的值定义了一个共同的类型，使你可以在你的代码中以类型安全的方式来使用这些值。
     
    如果你熟悉 C 语言，你会知道在 C 语言中，枚举会为一组整型值分配相关联的名称。
    Swift 中的枚举更加灵活，不必给每一个枚举成员提供一个值。
    如果给枚举成员提供一个值（称为原始值），则该值的类型可以是字符串、字符，或是一个整型值或浮点数。
     
    此外，枚举成员可以指定任意类型的关联值存储到枚举成员中，就像其他语言中的联合体（unions）和变体（variants）。你可以在一个枚举中定义一组相关的枚举成员，每一个枚举成员都可以有适当类型的关联值。
     
    在 Swift 中，枚举类型是一等（first-class）类型。它们采用了很多在传统上只被类（class）所支持的特性，
    例如计算属性（computed properties），用于提供枚举值的附加信息，实例方法（instance methods），
    用于提供和枚举值相关联的功能。枚举也可以定义构造函数（initializers）来提供一个初始值；
    可以在原始实现的基础上扩展它们的功能；还可以遵循协议（protocols）来提供标准的功能。*/
    
    enum CompassPoint {
        case north
        case south
        case east
        case west
    }
    
    func SetupTest() {
        Test()
        Test1()
        Test2()
        Test3()
        Test4()
    }
    
    ///-----------------------------枚举语法-----------------------------///
    func Test() {
        
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
    
    ///--------------------使用 Switch 语句匹配枚举值----------------------///
    func Test1() {
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
    ///--------------------枚举成员的遍历----------------------///
    func Test2() {
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
    
    ///--------------------关联值----------------------///
    func Test3() {
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
    ///--------------------原始值----------------------///
    func Test4() {
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
    
    ///-----------------------------递归枚举-----------------------------///
    func Test5() {
        
    }
    
    
    
}
