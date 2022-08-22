//
//  AMExtensionPart1.swift
//  AMSwiftTips
//
//  Created by AndyMu on 2020/10/24.
//

import Foundation

class AMExtensionPart1 {

    func SetupTest() {
        
    }
    
    // MARK: 1.1 =========================== 扩展的语法
//    extension SomeType {
//      // 在这里给 SomeType 添加新的功能
//    }
    
//    extension SomeType: SomeProtocol, AnotherProtocol {
//      // 协议所需要的实现写在这里
//    }
    
    // MARK: 1.2 =========================== 计算型属性
    /* 扩展可以给现有类型添加计算型实例属性和计算型类属性。*/
//    extension Double {
//        var km: Double { return self * 1_000.0 }
//        var m: Double { return self }
//        var cm: Double { return self / 100.0 }
//        var mm: Double { return self / 1_000.0 }
//        var ft: Double { return self / 3.28084 }
//    }
//    let oneInch = 25.4.mm
//    print("One inch is \(oneInch) meters")
//    // 打印“One inch is 0.0254 meters”
//    let threeFeet = 3.ft
//    print("Three feet is \(threeFeet) meters")
//    // 打印“Three feet is 0.914399970739201 meters”
    /* 注意
     扩展可以添加新的计算属性，但是它们不能添加存储属性，或向现有的属性添加属性观察者。*/
    
    // MARK: 1.3 =========================== 构造器
    /* 扩展可以给一个类添加新的便利构造器，但是它们不能给类添加新的指定构造器或者析构器。
    指定构造器和析构器必须始终由类的原始实现提供。*/
    
    /* 如果你使用扩展给另一个模块中定义的结构体添加构造器，
    那么新的构造器直到定义模块中使用一个构造器之前，不能访问 self。 */
    
    struct Size {
        var width = 0.0, height = 0.0
    }
    struct Point {
        var x = 0.0, y = 0.0
    }
    struct Rect {
        var origin = Point()
        var size = Size()
    }
    let defaultRect = Rect()
    let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
       size: Size(width: 5.0, height: 5.0))
    
//    extension Rect {
//        init(center: Point, size: Size) {
//            let originX = center.x - (size.width / 2)
//            let originY = center.y - (size.height / 2)
//            self.init(origin: Point(x: originX, y: originY), size: size)
//        }
//    }
//
//    let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
//                          size: Size(width: 3.0, height: 3.0))
//    // centerRect 的 origin 是 (2.5, 2.5) 并且它的 size 是 (3.0, 3.0)
//
    
    // MARK: 1.4 =========================== 方法
    /* 扩展可以给现有类型添加新的实例方法和类方法。在下面的例子中，给 Int 类型添加了一个新的实例方法叫做 repetitions：*/
//    extension Int {
//        func repetitions(task: () -> Void) {
//            for _ in 0..<self {
//                task()
//            }
//        }
//    }
//
//    3.repetitions {
//        print("Hello!")
//    }
    // Hello!
    // Hello!
    // Hello!
    
    // 可变实例方法
    /* 通过扩展添加的实例方法同样也可以修改（或 mutating（改变））实例本身。
    结构体和枚举的方法，若是可以修改 self 或者它自己的属性，则必须将这个实例方法标记为 mutating，就像是改变了方法的原始实现。*/
//    extension Int {
//        mutating func square() {
//            self = self * self
//        }
//    }
//    var someInt = 3
//    someInt.square()
    // someInt 现在是 9
    
    // MARK: 1.5 =========================== 下标
    /* 扩展可以给现有的类型添加新的下标。
    下面的例子中，对 Swift 的 Int 类型添加了一个整数类型的下标。
    下标 [n] 从数字右侧开始，返回小数点后的第 n 位：
    123456789[0] 返回 9
    123456789[1] 返回 8 */
    
//    extension Int {
//        subscript(digitIndex: Int) -> Int {
//            var decimalBase = 1
//            for _ in 0..<digitIndex {
//                decimalBase *= 10
//            }
//            return (self / decimalBase) % 10
//        }
//    }
//    746381295[0]
//    // 返回 5
//    746381295[1]
//    // 返回 9
//    746381295[2]
//    // 返回 2
//    746381295[8]
//    // 返回 7
    
    
    
    
    
    
    
}
