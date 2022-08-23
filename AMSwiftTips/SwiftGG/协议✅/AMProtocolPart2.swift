//
//  AMProtocolPart2.swift
//  AMSwiftTips
//
//  Created by AndyMu on 2020/10/24.
//

import Foundation

class AMProtocolPart2 {
    func setup() {
        point()
    }
    ///-------------------------协议构造器要求的类实现-----------------------------///
    /* 你可以在遵循协议的类中实现构造器，无论是作为指定构造器，还是作为便利构造器。
    无论哪种情况，你都必须为构造器实现标上 required 修饰符：*/
   
    /* 注意
    如果类已经被标记为 final，那么不需要在协议构造器的实现中使用 required 修饰符，
    因为 final 类不能有子类。关于 final 修饰符的更多内容，请参见 防止重写。*/
    func point() {
        class SomeClass: SomeProtocol2 {
            required init(someParameter: Int) {
                // 这里是构造器的实现部分
            }
        }
        
        class SomeSuperClass {
            init() {
                // 这里是构造器的实现部分
            }
        }

        class SomeSubClass: SomeSuperClass, SomeProtocol3 {
            // 因为遵循协议，需要加上 required
            // 因为继承自父类，需要加上 override
            required override init() {
                // 这里是构造器的实现部分
            }
        }
    }
    
    ///-------------------------协议作为类型-----------------------------///
    /*尽管协议本身并未实现任何功能，但是协议可以被当做一个功能完备的类型来使用。
    协议作为类型使用，有时被称作「存在类型」，这个名词来自「存在着一个类型 T，该类型遵循协议 T」。
    协议可以像其他普通类型一样使用，使用场景如下：
    作为函数、方法或构造器中的参数类型或返回值类型
    作为常量、变量或属性的类型
    作为数组、字典或其他容器中的元素类型*/
    func point1() {
        class LinearCongruentialGenerator : SomeProtocol4 {
            func random() -> Double {
                return 5;
            }
        }
        
        class Dice {
            let sides: Int
            let generator: SomeProtocol4
            init(sides: Int, generator: SomeProtocol4) {
                self.sides = sides
                self.generator = generator
            }
            func roll() -> Int {
                return Int(generator.random() * Double(sides)) + 1
            }
        }
        
        let d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
        for _ in 1...5 {
            print("Random dice roll is \(d6.roll())")
        }
        
    }
    
    ///-------------------------委托-----------------------------///
    
    /* 委托是一种设计模式，它允许类或结构体将一些需要它们负责的功能委托给其他类型的实例。
    委托模式的实现很简单：定义协议来封装那些需要被委托的功能，这样就能确保遵循协议的类型能提供这些功能。
    委托模式可以用来响应特定的动作，或者接收外部数据源提供的数据，而无需关心外部数据源的类型。*/
    
}

///-------------------------构造器要求-----------------------------///
/* 协议可以要求遵循协议的类型实现指定的构造器。
你可以像编写普通构造器那样，在协议的定义里写下构造器的声明，但不需要写花括号和构造器的实体：*/
protocol SomeProtocol2 {
    init(someParameter: Int)
}

protocol SomeProtocol3 {
    init()
}

///-------------------------可失败构造器要求-----------------------------///
/* 协议还可以为遵循协议的类型定义可失败构造器要求，详见 可失败构造器。
遵循协议的类型可以通过可失败构造器（init?）或非可失败构造器（init）来满足协议中定义的可失败构造器要求。
协议中定义的非可失败构造器要求可以通过非可失败构造器（init）或隐式解包可失败构造器（init!）来满足。*/

protocol SomeProtocol4 {
    func random() -> Double
}


