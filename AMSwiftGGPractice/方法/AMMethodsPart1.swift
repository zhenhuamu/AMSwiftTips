//
//  AMMethodsPart1.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/23.
//

import Foundation

class AMMethodsPart1 {
    /*
    方法是与某些特定类型相关联的函数。类、结构体、枚举都可以定义实例方法；
    实例方法为给定类型的实例封装了具体的任务与功能。类、结构体、枚举也可以定义类型方法；
    类型方法与类型本身相关联。类型方法与 Objective-C 中的类方法（class methods）相似。
    结构体和枚举能够定义方法是 Swift 与 C/Objective-C 的主要区别之一。
    在 Objective-C 中，类是唯一能定义方法的类型。
    但在 Swift 中，你不仅能选择是否要定义一个类/结构体/枚举，
    还能灵活地在你创建的类型（类/结构体/枚举）上定义方法。
     */
    func SetupTest() {
        Test()
    }
    ///-----------------------------实例方法-----------------------------///
    /* 实例方法是属于某个特定类、结构体或者枚举类型实例的方法。
    实例方法提供访问和修改实例属性的方法或提供与实例目的相关的功能，并以此来支撑实例的功能。
    实例方法的语法与函数完全一致，详情参见 函数。
    实例方法要写在它所属的类型的前后大括号之间。实例方法能够隐式访问它所属类型的所有的其他实例方法和属性。
    实例方法只能被它所属的类的某个特定实例调用。实例方法不能脱离于现存的实例而被调用。*/
    func Test() {
        class Counter {
            var count = 0
            func increment() {
                count += 1
            }
            func increment(by amount: Int) {
                count += amount
            }
            func reset() {
                count = 0
            }
        }
        
        let counter = Counter()
        // 初始计数值是0
        counter.increment()
        // 计数值现在是1
        counter.increment(by: 5)
        // 计数值现在是6
        counter.reset()
        // 计数值现在是0
    }
    ///-----------------------------self 属性-----------------------------///
    func Test1() {
        /* 类型的每一个实例都有一个隐含属性叫做 self，self 完全等同于该实例本身。
        你可以在一个实例的实例方法中使用这个隐含的 self 属性来引用当前实例。*/
        class Counter {
            var count = 0
            func increment() {
                self.count += 1
            }
        }
        // 如果不使用 self 前缀，Swift会认为 x 的两个用法都引用了名为 x 的方法参数。
        struct Point {
            var x = 0.0, y = 0.0
            func isToTheRightOf(x: Double) -> Bool {
                return self.x > x
            }
        }
        let somePoint = Point(x: 4.0, y: 5.0)
        if somePoint.isToTheRightOf(x: 1.0) {
            print("This point is to the right of the line where x == 1.0")
        }
        // 打印“This point is to the right of the line where x == 1.0”
    }
    ///--------------------------在实例方法中修改值类型--------------------------///
    /*
    结构体和枚举是值类型。默认情况下，值类型的属性不能在它的实例方法中被修改。
    但是，如果你确实需要在某个特定的方法中修改结构体或者枚举的属性，你可以为这个方法选择 可变（mutating）行为，然后就可以从其方法内部改变它的属性；
    并且这个方法做的任何改变都会在方法执行结束时写回到原始结构中。方法还可以给它隐含的 self 属性赋予一个全新的实例，这个新实例在方法结束时会替换现存实例。
     要使用 可变方法，将关键字 mutating 放到方法的 func 关键字之前就可以了：*/
    func Test2() {
        struct Point {
            var x = 0.0, y = 0.0
            mutating func moveBy(x deltaX: Double, y deltaY: Double) {
                x += deltaX
                y += deltaY
            }
        }
        var somePoint = Point(x: 1.0, y: 1.0)
        somePoint.moveBy(x: 2.0, y: 3.0)
        print("The point is now at (\(somePoint.x), \(somePoint.y))")
        // 打印“The point is now at (3.0, 4.0)”
    }
    ///--------------------------在可变方法中给 self 赋值--------------------------///
    func Test3() {
        struct Point {
            var x = 0.0, y = 0.0
            mutating func moveBy(x deltaX: Double, y deltaY: Double) {
                self = Point(x: x + deltaX, y: y + deltaY)
            }
        }
        // 新版的可变方法 moveBy(x:y:) 创建了一个新的结构体实例，它的 x 和 y 的值都被设定为目标值。调用这个版本的方法和调用上个版本的最终结果是一样的。
        enum TriStateSwitch {
            case off, low, high
            mutating func next() {
                switch self {
                case .off:
                    self = .low
                case .low:
                    self = .high
                case .high:
                    self = .off
                }
            }
        }
        var ovenLight = TriStateSwitch.low
        ovenLight.next()
        // ovenLight 现在等于 .high
        ovenLight.next()
        // ovenLight 现在等于 .off
        
        /* 上面的例子中定义了一个三态切换的枚举。每次调用 next() 方法时，开关在不同的电源状态（off, low, high）之间循环切换。*/
    }
    ///--------------------------类型方法--------------------------///
    /* 实例方法是被某个类型的实例调用的方法。你也可以定义在类型本身上调用的方法，这种方法就叫做类型方法。
    在方法的 func 关键字之前加上关键字 static，来指定类型方法。
    类还可以用关键字 class 来指定，从而允许子类重写父类该方法的实现。*/
    func Test4() {
        class SomeClass {
            class func someTypeMethod() {
                // 在这里实现类型方法
            }
        }
        SomeClass.someTypeMethod()
    }
}
