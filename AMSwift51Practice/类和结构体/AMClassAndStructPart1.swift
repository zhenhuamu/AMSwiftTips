//
//  AMClassAndStructPart1.swift
//  AMSwift51Practice
//
//  Created by AndyMu on 2020/10/13.
//

import Foundation

class AMClassAndStructPart1: NSObject {
    func SetupTest() {
        Test()
        Test1()
    }
    
    /*结构体和类作为一种通用而又灵活的结构，成为了人们构建代码的基础。
     你可以使用定义常量、变量和函数的语法，为你的结构体和类定义属性、添加方法。*/
    /*与其他编程语言所不同的是，Swift 并不要求你为自定义的结构体和类的接口与实现代码分别创建文件。
     你只需在单一的文件中定义一个结构体或者类，系统将会自动生成面向其它代码的外部接口。*/
    
    ///-----------------------------结构体和类对比-----------------------------///
    // Swift 中结构体和类有很多共同点
    /*
    ①定义属性用于存储值
    ②定义方法用于提供功能
    ③定义下标操作用于通过下标语法访问它们的值
    ④定义构造器用于设置初始值
    ⑤通过扩展以增加默认实现之外的功能
    ⑥遵循协议以提供某种标准功能
    */
    
    // 与结构体相比，类还有如下的附加功能：
    /*
     ①继承允许一个类继承另一个类的特征
     ②类型转换允许在运行时检查和解释一个类实例的类型
     ③析构器允许一个类实例释放任何其所被分配的资源
     ④引用计数允许对一个类的多次引用
     */
    
    /*类支持的附加功能是以增加复杂性为代价的。
     作为一般准则，优先使用结构体，因为它们更容易理解，仅在适当或必要时才使用类。*/
    
    ///--------------类型定义的语法、结构体和类的实例、属性访问-----------------///
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
    }
    
    ///-----------------------------结构体和枚举是值类型-----------------------------///
    // 值类型是这样一种类型，当它被赋值给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝。
    /*
    在之前的章节中，你已经大量使用了值类型。
    实际上，Swift 中所有的基本类型：整数（integer）、浮点数（floating-point number）、布尔值（boolean）、字符串（string)、数组（array）和字典（dictionary），
    都是值类型，其底层也是使用结构体实现的。*/
    
    /* Swift 中所有的结构体和枚举类型都是值类型。
     这意味着它们的实例，以及实例中所包含的任何值类型的属性，在代码中传递的时候都会被复制。*/
    
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
    
    ///-----------------------------类是引用类型-----------------------------///
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
    
    ///-----------------------------恒等运算符-----------------------------///
    /* 因为类是引用类型，所以多个常量和变量可能在幕后同时引用同一个类实例。
     （对于结构体和枚举来说，这并不成立。因为它们作为值类型，在被赋予到常量、变量或者传递到函数时，其值总是会被拷贝。）*/
    /*
    相同（===）
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
    
    ///-----------------------------指针-----------------------------///
    /* 如果你有 C，C++ 或者 Objective-C 语言的经验，
     那么你也许会知道这些语言使用指针来引用内存中的地址。
     Swift 中引用了某个引用类型实例的常量或变量，与 C 语言中的指针类似，
     不过它并不直接指向某个内存地址，也不要求你使用星号（*）来表明你在创建一个引用。
     相反，Swift 中引用的定义方式与其它的常量或变量的一样。
     如果需要直接与指针交互，你可以使用标准库提供的指针和缓冲区类型 */
    
}
