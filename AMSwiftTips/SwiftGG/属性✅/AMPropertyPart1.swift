//
//  AMPropertyPart1.swift
//  AMSwiftTips
//
//  Created by AndyMu on 2020/10/14.
//

import Foundation

class AMPropertyPart1 {
    func SetupTest() {
        Test()
        Test1()
        Test2()
    }
    
    // MARK: 1.1 =========================== 存储属性
    func Test() {
        struct FixedLengthRange {
            var firstValue: Int
            let length: Int
        }
        var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
        // 该区间表示整数 0，1，2
        rangeOfThreeItems.firstValue = 6
        // 该区间现在表示整数 6，7，8
        
        // 常量结构体实例的存储属性
        /*如果创建了一个结构体实例并将其赋值给一个常量，
        则无法修改该实例的任何属性，即使被声明为可变属性也不行:
        这种行为是由于结构体属于值类型。当值类型的实例被声明为常量的时候，它的所有属性也就成了常量。*/
        
//        let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
        // 该区间表示整数 0，1，2，3
//        rangeOfFourItems.firstValue = 6
        // 尽管 firstValue 是个可变属性，但这里还是会报错
    }
    
    // MARK: 1.2 =========================== 延时加载存储属性
    /* 延时加载存储属性是指当第一次被调用的时候才会计算其初始值的属性。
     在属性声明前使用 lazy 来标示一个延时加载存储属性。*/
    /* 必须将延时加载属性声明成变量（使用 var 关键字），因为属性的初始值可能在实例构造完成之后才会得到。
     而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延时加载。*/
    func Test1() {
        class DataImporter {
            /*
            DataImporter 是一个负责将外部文件中的数据导入的类。
            这个类的初始化会消耗不少时间。
            */
            var fileName = "data.txt"
            // 这里会提供数据导入功能
        }

        class DataManager {
            lazy var importer = DataImporter()
            var data = [String]()
            // 这里会提供数据管理功能
        }

        let manager = DataManager()
        manager.data.append("Some data")
        manager.data.append("Some more data")
        // DataImporter 实例的 importer 属性还没有被创建
        /*由于使用了 lazy，DataImporter 的实例 importer 属性只有在第一次被访问的时候才被创建。比如访问它的属性 fileName 时：*/
        print(manager.importer.fileName)
        // DataImporter 实例的 importer 属性现在被创建了
        // 输出“data.txt”
    }
    
    // MARK: 1.3 =========================== 存储属性和实例变量
    /* 如果你有过 Objective-C 经验，应该知道 Objective-C 为类实例存储值和引用提供两种方法。
     除了属性之外，还可以使用实例变量作为一个备份存储将变量值赋值给属性。
     Swift 编程语言中把这些理论统一用属性来实现。
     Swift 中的属性没有对应的实例变量，属性的备份存储也无法直接访问*/
    
    // MARK: 1.4 =========================== 计算属性
    /* 除存储属性外，类、结构体和枚举可以定义计算属性。
     计算属性不直接存储值，而是提供一个 getter 和一个可选的 setter，来间接获取和设置其他属性或变量的值。*/
    func Test2() {
        struct Point {
            var x = 0.0, y = 0.0
        }
        struct Size {
            var width = 0.0, height = 0.0
        }
        struct Rect {
            var origin = Point()
            var size = Size()
            var center: Point {
                get {
                    let centerX = origin.x + (size.width / 2)
                    let centerY = origin.y + (size.height / 2)
                    return Point(x: centerX, y: centerY)
                }
                set(newCenter) {
                    origin.x = newCenter.x - (size.width / 2)
                    origin.y = newCenter.y - (size.height / 2)
                }
            }
        }
        var square = Rect(origin: Point(x: 0.0, y: 0.0),
            size: Size(width: 10.0, height: 10.0))
        square.center = Point(x: 15.0, y: 15.0)
        print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
        // 打印“square.origin is now at (10.0, 10.0)”
        
        // 简化 Setter 声明
        /* 如果计算属性的 setter 没有定义表示新值的参数名，则可以使用默认名称 newValue。下面是使用了简化 setter 声明的 Rect 结构体代码：*/
        struct AlternativeRect {
            var origin = Point()
            var size = Size()
            var center: Point {
                get {
                    let centerX = origin.x + (size.width / 2)
                    let centerY = origin.y + (size.height / 2)
                    return Point(x: centerX, y: centerY)
                }
                set {
                    origin.x = newValue.x - (size.width / 2)
                    origin.y = newValue.y - (size.height / 2)
                }
            }
        }
        
        // 简化 Getter 声明
        /* 如果整个 getter 是单一表达式，getter 会隐式地返回这个表达式结果。下面是另一个版本的 Rect 结构体，用到了简化的 getter 和 setter 声明：*/
        struct CompactRect {
            var origin = Point()
            var size = Size()
            var center: Point {
                get {
                    Point(x: origin.x + (size.width / 2),
                          y: origin.y + (size.height / 2))
                }
                set {
                    origin.x = newValue.x - (size.width / 2)
                    origin.y = newValue.y - (size.height / 2)
                }
            }
        }
        
        // 只读计算属性
        /* 只有 getter 没有 setter 的计算属性叫只读计算属性。
         只读计算属性总是返回一个值，可以通过点运算符访问，但不能设置新的值。*/
        /* 只读计算属性的声明可以去掉 get 关键字和花括号：*/
        struct Cuboid {
            var width = 0.0, height = 0.0, depth = 0.0
            var volume: Double {
                return width * height * depth
            }
        }
        let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
        print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
        // 打印“the volume of fourByFiveByTwo is 40.0”
    }
    
    
}
