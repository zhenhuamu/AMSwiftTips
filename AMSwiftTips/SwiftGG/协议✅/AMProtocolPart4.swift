//
//  AMProtocolPart4.swift
//  AMSwiftTips
//
//  Created by AndyMu on 2020/10/24.
//

import Foundation

class AMProtocolPart4 {
    
    func setup() {
        point()
        
    }
    ///-------------------------检查协议一致性-----------------------------///
    /* 你可以使用 类型转换 中描述的 is 和 as 操作符来检查协议一致性，即是否遵循某协议，并且可以转换到指定的协议类型。
     检查和转换协议的语法与检查和转换类型是完全一样的：
    is 用来检查实例是否遵循某个协议，若遵循则返回 true，否则返回 false；
    as? 返回一个可选值，当实例遵循某个协议时，返回类型为协议类型的可选值，否则返回 nil；
    as! 将实例强制向下转换到某个协议类型，如果强转失败，将触发运行时错误。*/
    func point() {
        print("=========================== 检查协议一致性")
        class Circle: HasArea {
            let pi = 3.1415927
            var radius: Double
            var area: Double { return pi * radius * radius }
            init(radius: Double) { self.radius = radius }
        }
        class Country: HasArea {
            var area: Double
            init(area: Double) { self.area = area }
        }
        class Animal {
            var legs: Int
            init(legs: Int) { self.legs = legs }
        }
        let objects: [AnyObject] = [
            Circle(radius: 2.0),
            Country(area: 243_610),
            Animal(legs: 4)
        ]
        
        for object in objects {
            if let objectWithArea = object as? HasArea {
                print("Area is \(objectWithArea.area)")
            } else {
                print("Something that doesn't have an area")
            }
        }
        // Area is 12.5663708
        // Area is 243610.0
        // Something that doesn't have an area
    }
    
    ///-------------------------协议扩展-----------------------------///
    func point1() {
//        class LinearCongruentialGenerator:RandomNumberGenerator {
//            
//        }
//        let generator = LinearCongruentialGenerator()
//        print("And here's a random Boolean: \(generator.randomBool())")
        // 打印 “And here's a random Boolean: true”
        /* 协议扩展可以为遵循协议的类型增加实现，但不能声明该协议继承自另一个协议。
         协议的继承只能在协议声明处进行指定。*/
    }
}

protocol HasArea {
    var area: Double { get }
}

///-------------------------可选的协议要求-----------------------------///
/* 协议可以定义可选要求，遵循协议的类型可以选择是否实现这些要求。
在协议中使用 optional 关键字作为前缀来定义可选要求。
可选要求用在你需要和 Objective-C 打交道的代码中。
协议和可选要求都必须带上 @objc 属性。
标记 @objc 特性的协议只能被继承自 Objective-C 类的类或者 @objc
类遵循，其他类以及结构体和枚举均不能遵循这种协议。*/

@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

///-------------------------协议扩展-----------------------------///
/* 协议可以通过扩展来为遵循协议的类型提供属性、方法以及下标的实现。
通过这种方式，你可以基于协议本身来实现这些功能，
而无需在每个遵循协议的类型中都重复同样的实现，也无需使用全局函数。*/

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return arc4random() > Int(0.5)
    }
}

///-------------------------为协议扩展添加限制条件-----------------------------///
/* 在扩展协议的时候，可以指定一些限制条件，只有遵循协议的类型满足这些限制条件时，才能获得协议扩展提供的默认实现。
这些限制条件写在协议名之后，使用 where 子句来描述，正如 泛型 Where 子句 中所描述的。*/

extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}
