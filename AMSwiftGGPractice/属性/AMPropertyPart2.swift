//
//  AMPropertyPart2.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/14.
//

import Foundation

class AMPropertyPart2 {
    func SetupTest() {
        Test()
    }
    ///-----------------------------属性观察器-----------------------------///
    /*属性观察器监控和响应属性值的变化，每次属性被设置值的时候都会调用属性观察器，即使新值和当前值相同的时候也不例外。*/
    /*你可以在以下位置添加属性观察器：
    自定义的存储属性
    继承的存储属性
    继承的计算属性*/
    
    /* 可以为属性添加其中一个或两个观察器：
     willSet 在新的值被设置之前调用
     didSet 在新的值被设置之后调用*/
    
    func Test() {
        class StepCounter {
            var totalSteps: Int = 0 {
                willSet(newTotalSteps) {
                    print("将 totalSteps 的值设置为 \(newTotalSteps)")
                }
                didSet {
                    if totalSteps > oldValue  {
                        print("增加了 \(totalSteps - oldValue) 步")
                    }
                }
            }
        }
        let stepCounter = StepCounter()
        stepCounter.totalSteps = 200
        // 将 totalSteps 的值设置为 200
        // 增加了 200 步
        stepCounter.totalSteps = 360
        // 将 totalSteps 的值设置为 360
        // 增加了 160 步
        stepCounter.totalSteps = 896
        // 将 totalSteps 的值设置为 896
        // 增加了 536 步
    }
    
    ///-----------------------------属性包装器-----------------------------///
    
    ///--------------------------全局变量和局部变量-------------------------///
    /*计算属性和观察属性所描述的功能也可以用于全局变量和局部变量。
    全局变量是在函数、方法、闭包或任何类型之外定义的变量。
    局部变量是在函数、方法或闭包内部定义的变量。
    前面章节提到的全局或局部变量都属于存储型变量，跟存储属性类似，它为特定类型的值提供存储空间，并允许读取和写入。
    另外，在全局或局部范围都可以定义计算型变量和为存储型变量定义观察器。计算型变量跟计算属性一样，返回一个计算结果而不是存储值，声明格式也完全一样。*/
    
    /*全局的常量或变量都是延迟计算的，跟 延时加载存储属性 相似，不同的地方在于，全局的常量或变量不需要标记 lazy 修饰符。
    局部范围的常量和变量从不延迟计算。*/
    
    ///--------------------------类型属性-------------------------///
    /* 实例属性属于一个特定类型的实例，
     每创建一个实例，实例都拥有属于自己的一套属性值，实例之间的属性相互独立。*/
    /* 类型属性用于定义某个类型所有实例共享的数据，比如所有实例都能用的一个常量（就像 C 语言中的静态常量），或者所有实例都能访问的一个变量（就像 C 语言中的静态变量）。*/
    func Test1() {
        /*使用关键字 static 来定义类型属性。在为类定义计算型类型属性时，可以改用关键字 class 来支持子类对父类的实现进行重写。下面的例子演示了存储型和计算型类型属性的语法：*/
        struct SomeStructure {
            static var storedTypeProperty = "Some value."
            static var computedTypeProperty: Int {
                return 1
            }
        }
        enum SomeEnumeration {
            static var storedTypeProperty = "Some value."
            static var computedTypeProperty: Int {
                return 6
            }
        }
        class SomeClass {
            static var storedTypeProperty = "Some value."
            static var computedTypeProperty: Int {
                return 27
            }
            class var overrideableComputedTypeProperty: Int {
                return 107
            }
        }
        
        /* 跟实例属性一样，类型属性也是通过点运算符来访问。
        但是，类型属性是通过类型本身来访问，而不是通过实例。*/
        print(SomeStructure.storedTypeProperty)
        // 打印“Some value.”
        SomeStructure.storedTypeProperty = "Another value."
        print(SomeStructure.storedTypeProperty)
        // 打印“Another value.”
        print(SomeEnumeration.computedTypeProperty)
        // 打印“6”
        print(SomeClass.computedTypeProperty)
        // 打印“27”
    }
}
