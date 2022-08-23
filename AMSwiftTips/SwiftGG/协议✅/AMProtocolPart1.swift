//
//  AMProtocolPart1.swift
//  AMSwiftTips
//
//  Created by AndyMu on 2020/10/24.
//

import Foundation

class AMProtocolPart1 {

    func setup() {
        point()
        point1()
    }
    
    // MARK: 1.1 =========================== 协议语法
    func point() {
        class SomeClass: FirstProtocol, AnotherProtocol {
            // 这里是类的定义部分
        }
    }

    // MARK: 1.2 =========================== 异变方法要求
    func point1() {
        enum OnOffSwitch: Togglable {
            case off, on
            mutating func toggle() {
                switch self {
                case .off:
                    self = .on
                case .on:
                    self = .off
                }
            }
        }
        var lightSwitch = OnOffSwitch.off
        lightSwitch.toggle()
        // lightSwitch 现在的值为 .on
    }
}

///-------------------------协议语法-----------------------------///
protocol FirstProtocol {
    // 这里是协议的定义部分
}

protocol AnotherProtocol {
    // 这里是协议的定义部分
}

///-------------------------属性要求-----------------------------///
/*协议可以要求遵循协议的类型提供特定名称和类型的实例属性或类型属性。
协议不指定属性是存储属性还是计算属性，它只指定属性的名称和类型。
此外，协议还指定属性是可读的还是可读可写的。*/

/* 协议总是用 var 关键字来声明变量属性，在类型声明后加上 { set get } 来表示属性是可读可写的，
可读属性则用 { get } 来表示：*/
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

/* 在协议中定义类型属性时，总是使用 static 关键字作为前缀。
当类类型遵循协议时，除了 static 关键字，还可以使用 class 关键字来声明类型属性：*/
protocol AnotherProtocol1 {
    static var someTypeProperty: Int { get set }
}

///-------------------------方法要求-----------------------------///
/* 协议可以要求遵循协议的类型实现某些指定的实例方法或类方法。
这些方法作为协议的一部分，像普通方法一样放在协议的定义中，但是不需要大括号和方法体。
可以在协议中定义具有可变参数的方法，和普通方法的定义方式相同。
但是，不支持为协议中的方法提供默认参数。
正如属性要求中所述，在协议中定义类方法的时候，总是使用 static 关键字作为前缀。
即使在类实现时，类方法要求使用 class 或 static 作为关键字前缀，前面的规则仍然适用：*/

protocol SomeProtocol1 {
    static func someTypeMethod()
}

protocol RandomNumberGenerator1 {
    func random() -> Double
}

///-------------------------异变方法要求-----------------------------///
/* 有时需要在方法中改变（或异变）方法所属的实例。
例如，在值类型（即结构体和枚举）的实例方法中，将 mutating 关键字作为方法的前缀，
写在 func 关键字之前，表示可以在该方法中修改它所属的实例以及实例的任意属性的值。
这一过程在 在实例方法中修改值类型 章节中有详细描述。*/

/* 注意
实现协议中的 mutating 方法时，若是类类型，则不用写 mutating 关键字。
而对于结构体和枚举，则必须写 mutating 关键字。*/
protocol Togglable {
    mutating func toggle()
}
