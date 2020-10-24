//
//  AMProtocolPart3.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/24.
//

import Foundation

class AMProtocolPart3 {
    
    func SetupTest() {
        Test()
        Test1()
        Test2()
    }
    
    ///-------------------------使用合成实现来采纳协议-----------------------------///
    /*
    Swift 可以自动提供一些简单场景下遵循 Equatable、Hashable 和 Comparable 协议的实现。
    在使用这些合成实现之后，无需再编写重复的代码来实现这些协议所要求的方法。
    Swift 为以下几种自定义类型提供了 Equatable 协议的合成实现：
    遵循 Equatable 协议且只有存储属性的结构体。
    遵循 Equatable 协议且只有关联类型的枚举
    没有任何关联类型的枚举*/
    func Test() {
        struct Vector3D: Equatable {
            var x = 0.0, y = 0.0, z = 0.0
        }

        let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
        let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
        /* 在包含类型原始声明的文件中声明对 Equatable 协议的遵循，
        可以得到 == 操作符的合成实现，且无需自己编写任何关于 == 的实现代码。
        Equatable 协议同时包含 != 操作符的默认实现。*/
        if twoThreeFour == anotherTwoThreeFour {
            print("These two vectors are also equivalent.")
        }
        // 打印 "These two vectors are also equivalent."
    }
    /* Swift 为以下几种自定义类型提供了 Hashable 协议的合成实现：
     遵循 Hashable 协议且只有存储属性的结构体。
     遵循 Hashable 协议且只有关联类型的枚举
     没有任何关联类型的枚举*/
    /* 在包含类型原始声明的文件中声明对 Hashable 协议的遵循，可以得到 hash(into:) 的合成实现，且无需自己编写任何关于 hash(into:) 的实现代码。*/
    func Test1() {
        enum SkillLevel: Comparable {
            case beginner
            case intermediate
            case expert(stars: Int)
        }
        let levels = [SkillLevel.intermediate, SkillLevel.beginner,
                      SkillLevel.expert(stars: 5), SkillLevel.expert(stars: 3)]
        for level in levels.sorted() {
            print(level)
        }
        // 打印 "beginner"
        // 打印 "intermediate"
        // 打印 "expert(stars: 3)"
        // 打印 "expert(stars: 5)"
    }
    ///-------------------------协议合成-----------------------------///
    /*要求一个类型同时遵循多个协议是很有用的。你可以使用协议组合来复合多个协议到一个要求里。协议组合行为就和你定义的临时局部协议一样拥有构成中所有协议的需求。协议组合不定义任何新的协议类型。
    协议组合使用 SomeProtocol & AnotherProtocol 的形式。你可以列举任意数量的协议，用和符号（&）分开。除了协议列表，协议组合也能包含类类型，这允许你标明一个需要的父类。*/
    func Test2() {
        struct Person: Named, Aged {
            var name: String
            var age: Int
        }
        func wishHappyBirthday(to celebrator: Named & Aged) {
            print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
        }
        let birthdayPerson = Person(name: "Malcolm", age: 21)
        wishHappyBirthday(to: birthdayPerson)
        // 打印 “Happy birthday Malcolm - you're 21!”
    }
    
}

///-------------------------在扩展里添加协议遵循-----------------------------///
/* 即便无法修改源代码，依然可以通过扩展令已有类型遵循并符合协议。
扩展可以为已有类型添加属性、方法、下标以及构造器，因此可以符合协议中的相应要求。
详情请在 扩展 章节中查看。*/

protocol TextRepresentable {
    var textualDescription: String { get }
}

class Dice {
    
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return ""
    }
}

///-------------------------有条件地遵循协议-----------------------------///

///-------------------------在扩展里声明采纳协议-----------------------------///
/* 当一个类型已经遵循了某个协议中的所有要求，却还没有声明采纳该协议时，可以通过空的扩展来让它采纳该协议*/
/* 注意
 即使满足了协议的所有要求，类型也不会自动遵循协议，必须显式地遵循协议。*/
struct Hamster {
    var name: String
       var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}

///-------------------------协议的继承-----------------------------///
/*协议能够继承一个或多个其他协议，可以在继承的协议的基础上增加新的要求。
协议的继承语法与类的继承相似，多个被继承的协议间用逗号分隔：*/

protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

///-------------------------类专属的协议-----------------------------///
/* 你通过添加 AnyObject 关键字到协议的继承列表，就可以限制协议只能被类类型采纳（以及非结构体或者非枚举的类型）。*/
protocol SomeClassOnlyProtocol: AnyObject {
    // 这里是类专属协议的定义部分
}

/* 注意
当协议定义的要求需要遵循协议的类型必须是引用语义而非值语义时，应该采用类类型专属协议。
关于引用语义和值语义的更多内容，请查看 结构体和枚举是值类型 和 类是引用类型。*/


protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}

