//
//  AMInheritPart1.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/23.
//

import Foundation

class AMInheritPart1 {
    /*
    一个类可以继承另一个类的方法，属性和其它特性。
    当一个类继承其它类时，继承类叫子类，被继承类叫超类（或父类）。
    在Swift中，继承是区分「类」与其它类型的一个基本特征。
    在Swift中，类可以调用和访问超类的方法、属性和下标，并且可以重写这些方法，属性和下标来优化或修改它们的行为。
    Swift 会检查你的重写定义在超类中是否有匹配的定义，以此确保你的重写行为是正确的。
    可以为类中继承来的属性添加属性观察器，这样一来，当属性值改变时，类就会被通知到。
    可以为任何属性添加属性观察器，无论它原本被定义为存储型属性还是计算型属性。*/
    func SetupTest() {
        Test()
        Test1()
    }
    
    ///-----------------------------子类生成-----------------------------///
    func Test() {
        /* 注意
         Swift 中的类并不是从一个通用的基类继承而来的。
         如果你不为自己定义的类指定一个超类的话，这个类就会自动成为基类。*/
        class Vehicle {
            var currentSpeed = 0.0
            var description: String {
                return "traveling at \(currentSpeed) miles per hour"
            }
            func makeNoise() {
                // 什么也不做——因为车辆不一定会有噪音
            }
        }
        let someVehicle = Vehicle()
        print("Vehicle: \(someVehicle.description)")
        // 打印“Vehicle: traveling at 0.0 miles per hour”
        
        // 子类生成
        class Bicycle: Vehicle {
            var hasBasket = false
        }
        let bicycle = Bicycle()
        bicycle.hasBasket = true
        bicycle.currentSpeed = 15.0
        print("Bicycle: \(bicycle.description)")
        // 打印“Bicycle: traveling at 15.0 miles per hour”
        
        class Tandem: Bicycle {
            var currentNumberOfPassengers = 0
        }
        
        let tandem = Tandem()
        tandem.hasBasket = true
        tandem.currentNumberOfPassengers = 2
        tandem.currentSpeed = 22.0
        print("Tandem: \(tandem.description)")
        // 打印：“Tandem: traveling at 22.0 miles per hour”
        
    }
    
    ///-----------------------------重写-----------------------------///
    /*
     子类可以为继承来的实例方法，类方法，实例属性，类属性，或下标提供自己定制的实现。
     我们把这种行为叫重写。
     如果要重写某个特性，你需要在重写定义的前面加上 override 关键字。
     这么做，就表明了你是想提供一个重写版本，而非错误地提供了一个相同的定义。
     意外的重写行为可能会导致不可预知的错误，任何缺少 override 关键字的重写都会在编译时被认定为错误。
     override 关键字会提醒 Swift 编译器去检查该类的超类（或其中一个超类）是否有匹配重写版本的声明。
     这个检查可以确保你的重写定义是正确的。*/
    
    /* 在合适的地方，你可以通过使用 super 前缀来访问超类版本的方法，属性或下标：
     在方法 someMethod() 的重写实现中，可以通过 super.someMethod() 来调用超类版本的 someMethod() 方法。
     在属性 someProperty 的 getter 或 setter 的重写实现中，可以通过 super.someProperty 来访问超类版本的 someProperty 属性。
     在下标的重写实现中，可以通过 super[someIndex] 来访问超类版本中的相同下标。*/
    
    func Test1() {
        class Vehicle {
            var currentSpeed = 0.0
            var description: String {
                return "traveling at \(currentSpeed) miles per hour"
            }
            func makeNoise() {
                // 什么也不做——因为车辆不一定会有噪音
            }
        }
        // 重写方法
        class Train: Vehicle {
            override func makeNoise() {
                print("Choo Choo")
            }
        }
        // 重写属性
        /*注意
        如果你在重写属性中提供了 setter，那么你也一定要提供 getter。
        如果你不想在重写版本中的 getter 里修改继承来的属性值，你可以直接通过 super.someProperty
        来返回继承来的值，其中 someProperty 是你要重写的属性的名字。*/
        class Car: Vehicle {
            var gear = 1
            override var description: String {
                return super.description + " in gear \(gear)"
            }
        }
        // 重写属性观察器
        class AutomaticCar: Car {
            override var currentSpeed: Double {
                didSet {
                    gear = Int(currentSpeed / 10.0) + 1
                }
            }
        }
        
        let automatic = AutomaticCar()
        automatic.currentSpeed = 35.0
        print("AutomaticCar: \(automatic.description)")
        // 打印“AutomaticCar: traveling at 35.0 miles per hour in gear 4”
        
    }
    ///-----------------------------防止重写-----------------------------///
    /*你可以通过把方法，属性或下标标记为 final 来防止它们被重写，只需要在声明关键字前加上 final 修饰符即可（例如：final var、final func、final class func 以及 final subscript）。
    任何试图对带有 final 标记的方法、属性或下标进行重写的代码，都会在编译时会报错。
    在类扩展中的方法，属性或下标也可以在扩展的定义里标记为 final。
    可以通过在关键字 class 前添加 final 修饰符（final class）来将整个类标记为 final 。
    这样的类是不可被继承的，试图继承这样的类会导致编译报错。*/
}
