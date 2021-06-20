//
//  AMClassAndStructPart1.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/13.
//

import Foundation

class AMClassAndStructPart1 {
    func SetupTest() {
        Test()
        Test1()
        Test2()
        Test3()
    }
    
    // MARK: 1.1 =========================== 类型定义的语法、结构体和类的实例、属性访问
    struct SomeStructure {
        // 在这里定义结构体
    }
    
    class SomeClass {
        // 在这里定义类
    }
    
    // 定义结构体和定义类的示例
    struct Resolution:Equatable {
        var width = 0
        var height = 0
    }
    
    class VideoMode {
        var resolution = Resolution()
        var interlaced = false
        var frameRate = 0.0
        var name: String?
    }
    // 结构体和类的实例
    let someResolution = Resolution()
    let someVideoMode = VideoMode()
    
    func Test() {
        // 属性访问
        print("The width of someResolution is \(someResolution.width)")
        // 打印 "The width of someResolution is 0"
        print("The width of someVideoMode is \(someVideoMode.resolution.width)")
        // 打印 "The width of someVideoMode is 0"
        // 属性赋值
        someVideoMode.resolution.width = 1280
        print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
        // 打印 "The width of someVideoMode is now 1280"
        
        // 结构体类型的成员逐一构造器
        // 所有结构体都有一个自动生成的成员逐一构造器，用于初始化新结构体实例中成员的属性
        _ = Resolution(width: 640, height: 480)
        _ = Resolution(width: 10)
        _ = Resolution(height: 20)
    }
    
    // MARK: 1.2 =========================== 结构体和枚举是值类型
    func Test1() {
        let hd = Resolution(width: 1920, height: 1080)
        var cinema = hd
        cinema.width = 2048
        print("cinema is now  \(cinema.width) pixels wide")
        // 打印 "cinema is now 2048 pixels wide"
        print("hd is still \(hd.width) pixels wide")
        // 打印 "hd is still 1920 pixels wide"
        
        /*将 hd 赋值给 cinema 时，hd 中所存储的值会拷贝到新的 cinema 实例中。
         结果就是两个完全独立的实例包含了相同的数值。
         由于两者相互独立，因此将 cinema 的 width 修改为 2048 并不会影响 hd 中的 width 的值*/
    }
    
    // MARK: 1.3 =========================== 类是引用类型
    /* 与值类型不同，引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝。
     因此，使用的是已存在实例的引用，而不是其拷贝。*/
    func Test2() {
        let tenEighty = VideoMode()
        tenEighty.resolution = Resolution(width: 1920, height: 1080)
        tenEighty.interlaced = true
        tenEighty.name = "1080i"
        tenEighty.frameRate = 25.0
        
        let alsoTenEighty = tenEighty
        alsoTenEighty.frameRate = 30.0
        print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
        // 打印 "The frameRate property of theEighty is now 30.0"
    }
    
    // MARK: 1.4 =========================== 恒等运算符
    /* 因为类是引用类型，所以多个常量和变量可能在幕后同时引用同一个类实例。
     （对于结构体和枚举来说，这并不成立。因为它们作为值类型，在被赋予到常量、变量或者传递到函数时，其值总是会被拷贝。）*/
    /*
    相同 引用类型（===）值类型 (==)
    不相同（!==）
    */
    
    func Test3() {
        
        let hd = Resolution(width: 1920, height: 1080)
        let alsohd = hd
        if alsohd == hd {
            print("hd and alsohd is same ")
        }
        // 打印 "hd and alsohd is same "
        
        let tenEighty = VideoMode()
        let alsoTenEighty = tenEighty
        if tenEighty === alsoTenEighty {
            print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
        }
        // 打印 "tenEighty and alsoTenEighty refer to the same VideoMode instance."
    }
    
    // MARK: 1.5 =========================== 指针
    /* 如果你有 C，C++ 或者 Objective-C 语言的经验，
     那么你也许会知道这些语言使用指针来引用内存中的地址。
     Swift 中引用了某个引用类型实例的常量或变量，与 C 语言中的指针类似，
     不过它并不直接指向某个内存地址，也不要求你使用星号（*）来表明你在创建一个引用。
     相反，Swift 中引用的定义方式与其它的常量或变量的一样。
     如果需要直接与指针交互，你可以使用标准库提供的指针和缓冲区类型 */
    
}
