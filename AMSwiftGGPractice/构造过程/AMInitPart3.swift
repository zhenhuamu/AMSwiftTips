//
//  AMInitPart3.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/23.
//

import Foundation

class AMInitPart3 {
    
    
    func SetupTest() {
        Test()
        Test1()
        Test2()
        Test3()
        Test4()
        Test5()
        Test6()
    }
    
    // MARK: 1.1 =========================== 可失败构造器
    /* 注意
     可失败构造器的参数名和参数类型，不能与其它非可失败构造器的参数名，及其参数类型相同。*/
    func Test() {
        let wholeNumber: Double = 12345.0
        let pi = 3.14159

        /* 例如，实现针对数字类型转换的可失败构造器。
        确保数字类型之间的转换能保持精确的值，使用这个 init(exactly:) 构造器。
        如果类型转换不能保持值不变，则这个构造器构造失败。*/
        if let valueMaintained = Int(exactly: wholeNumber) {
            print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)")
        }
        // 打印“12345.0 conversion to Int maintains value of 12345”

        let valueChanged = Int(exactly: pi)
        // valueChanged 是 Int? 类型，不是 Int 类型

        if valueChanged == nil {
            print("\(pi) conversion to Int does not maintain value")
        }
        // 打印“3.14159 conversion to Int does not maintain value”
        
        struct Animal {
            let species: String
            init?(species: String) {
                if species.isEmpty {
                    return nil
                }
                self.species = species
            }
        }
        
        let someCreature = Animal(species: "Giraffe")
        // someCreature 的类型是 Animal? 而不是 Animal

        if let giraffe = someCreature {
            print("An animal was initialized with a species of \(giraffe.species)")
        }
        // 打印“An animal was initialized with a species of Giraffe”
        
        let anonymousCreature = Animal(species: "")
        // anonymousCreature 的类型是 Animal?, 而不是 Animal

        if anonymousCreature == nil {
            print("The anonymous creature could not be initialized")
        }
        // 打印“The anonymous creature could not be initialized”
        
    }
    
    // MARK: 1.2 =========================== 枚举类型的可失败构造器
    func Test1() {
        enum TemperatureUnit {
            case Kelvin, Celsius, Fahrenheit
            init?(symbol: Character) {
                switch symbol {
                case "K":
                    self = .Kelvin
                case "C":
                    self = .Celsius
                case "F":
                    self = .Fahrenheit
                default:
                    return nil
                }
            }
        }
        
        let fahrenheitUnit = TemperatureUnit(symbol: "F")
        if fahrenheitUnit != nil {
            print("This is a defined temperature unit, so initialization succeeded.")
        }
        // 打印“This is a defined temperature unit, so initialization succeeded.”

        let unknownUnit = TemperatureUnit(symbol: "X")
        if unknownUnit == nil {
            print("This is not a defined temperature unit, so initialization failed.")
        }
        // 打印“This is not a defined temperature unit, so initialization failed.”
    }
    
    // MARK: 1.3 =========================== 带原始值的枚举类型的可失败构造器
    func Test2() {
        enum TemperatureUnit1: Character {
            case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
        }

        let fahrenheitUnit1 = TemperatureUnit1(rawValue: "F")
        if fahrenheitUnit1 != nil {
            print("This is a defined temperature unit, so initialization succeeded.")
        }
        // 打印“This is a defined temperature unit, so initialization succeeded.”

        let unknownUnit1 = TemperatureUnit1(rawValue: "X")
        if unknownUnit1 == nil {
            print("This is not a defined temperature unit, so initialization failed.")
        }
        // 打印“This is not a defined temperature unit, so initialization failed.”
    }
    
    // MARK: 1.4 =========================== 构造失败的传递
    ///------------------------构造失败的传递------------------------///
    /* 类、结构体、枚举的可失败构造器可以横向代理到它们自己其他的可失败构造器。
    类似的，子类的可失败构造器也能向上代理到父类的可失败构造器。
    无论是向上代理还是横向代理，如果你代理到的其他可失败构造器触发构造失败，
    整个构造过程将立即终止，接下来的任何构造代码不会再被执行。*/
    func Test3() {
        class Product {
            let name: String
            init?(name: String) {
                if name.isEmpty { return nil }
                self.name = name
            }
        }

        class CartItem: Product {
            let quantity: Int
            init?(name: String, quantity: Int) {
                if quantity < 1 { return nil }
                self.quantity = quantity
                super.init(name: name)
            }
        }
    }
    
    ///------------------------重写一个可失败构造器------------------------///
    func Test4() {
        class Document {
            var name: String?
            // 该构造器创建了一个 name 属性的值为 nil 的 document 实例
            init() {}
            // 该构造器创建了一个 name 属性的值为非空字符串的 document 实例
            init?(name: String) {
                if name.isEmpty { return nil }
                self.name = name
            }
        }
        
        class AutomaticallyNamedDocument: Document {
            override init() {
                super.init()
                self.name = "[Untitled]"
            }
            override init(name: String) {
                super.init()
                if name.isEmpty {
                    self.name = "[Untitled]"
                } else {
                    self.name = name
                }
            }
        }
        
        class UntitledDocument: Document {
            override init() {
                super.init(name: "[Untitled]")!
            }
        }
    }
    
    // MARK: 1.5 =========================== init! 可失败构造器
    /* 通常来说我们通过在 init 关键字后添加问号的方式（init?）来定义一个可失败构造器，但你也可以通过在 init 后面添加感叹号的方式来定义一个可失败构造器（init!），该可失败构造器将会构建一个对应类型的隐式解包可选类型的对象。
    你可以在 init? 中代理到 init!，反之亦然。你也可以用 init? 重写 init!，反之亦然。你还可以用 init 代理到 init!，不过，一旦 init! 构造失败，则会触发一个断言。*/
    
    // MARK: 1.6 =========================== 必要构造器
    // 在类的构造器前添加 required 修饰符表明所有该类的子类都必须实现该构造器
    func Test5() {
        class SomeClass {
            required init() {
                // 构造器的实现代码
            }
        }
        /* 在子类重写父类的必要构造器时，必须在子类的构造器前也添加 required 修饰符，
        表明该构造器要求也应用于继承链后面的子类。在重写父类中必要的指定构造器时，
        不需要添加 override 修饰符：*/
        class SomeSubclass: SomeClass {
            required init() {
                // 构造器的实现代码
            }
        }
    }
    
    // MARK: 1.7 =========================== 通过闭包或函数设置属性的默认值
    /* 如果某个存储型属性的默认值需要一些自定义或设置，你可以使用闭包或全局函数为其提供定制的默认值。
     每当某个属性所在类型的新实例被构造时，对应的闭包或函数会被调用，而它们的返回值会当做默认值赋值给这个属性。
     这种类型的闭包或函数通常会创建一个跟属性类型相同的临时变量，然后修改它的值以满足预期的初始状态，最后返回这个临时变量，作为属性的默认值。
     下面模板介绍了如何用闭包为属性提供默认值：*/
    func Test6() {
        /* 注意
         如果你使用闭包来初始化属性，请记住在闭包执行时，实例的其它部分都还没有初始化。
         这意味着你不能在闭包里访问其它属性，即使这些属性有默认值。同样，你也不能使用隐式的 self 属性，或者调用任何实例方法。*/
        
        /* 注意闭包结尾的花括号后面接了一对空的小括号。这用来告诉 Swift 立即执行此闭包。
        如果你忽略了这对括号，相当于将闭包本身作为值赋值给了属性，而不是将闭包的返回值赋值给属性。*/
        
        class SomeClass {
            let someProperty: String = {
                var someValue = ""
                // 在这个闭包中给 someProperty 创建一个默认值
                // someValue 必须和 String 类型相同
                return someValue
            }()
        }
        
        
        struct Chessboard {
            let boardColors: [Bool] = {
                var temporaryBoard = [Bool]()
                var isBlack = false
                for i in 1...8 {
                    for j in 1...8 {
                        temporaryBoard.append(isBlack)
                        isBlack = !isBlack
                    }
                    isBlack = !isBlack
                }
                return temporaryBoard
            }()
            func squareIsBlackAt(row: Int, column: Int) -> Bool {
                return boardColors[(row * 8) + column]
            }
        }
        
        let board = Chessboard()
        print(board.squareIsBlackAt(row: 0, column: 1))
        // 打印“true”
        print(board.squareIsBlackAt(row: 7, column: 7))
        // 打印“false”
    }
    
}
