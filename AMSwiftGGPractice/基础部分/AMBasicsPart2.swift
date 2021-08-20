//
//  AMBasicsPart2.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/12.
//

import Foundation

class AMBasicsPart2 {
    func SetupTest() {
        Point1()
        Point2()
        Point3()
        Point4()
        Point5()
        Point6()
        Point7()
    }
    
    // MARK: 1.6 =========================== 类型安全和类型推断
    func Point1() {
        print("=========================== 类型安全和类型推断")
        /// meaningOfLife 会被推测为 Int 类型
        let meaningOfLife = 42
        /// pi 会被推测为 Double 类型
        let pi = 3.14159
        /// anotherPi 会被推测为 Double 类型
        /// 原始值 3 没有显式声明类型，而表达式中出现了一个浮点字面量，所以表达式会被推断为 Double 类型
        let anotherPi = 3 + 0.14159
        print(meaningOfLife,pi,anotherPi)
    }
    // FIXME: 类型推断
    /// 当推断浮点数的类型时，Swift 总是会选择 Double 而不是 Float。
    
    // MARK: 1.7 =========================== 数值型字面量

    /// 整数字面量可以被写作：
    /// 一个十进制数，没有前缀
    /// 一个二进制数，前缀是 0b
    /// 一个八进制数，前缀是 0o
    /// 一个十六进制数，前缀是 0x
    
    func Point2() {
        print("=========================== 数值型字面量")
        let decimalInteger = 17
        /// 二进制的17
        let binaryInteger = 0b10001
        /// 八进制的17
        let octalInteger = 0o21
        /// 十六进制的17
        let hexadecimalInteger = 0x11
        print(decimalInteger,binaryInteger,octalInteger,hexadecimalInteger)
    }
    
    /// 浮点字面量可以是十进制（没有前缀）或者是十六进制（前缀是 0x ）
    /// 小数点两边必须有至少一个十进制数字（或者是十六进制的数字）
    /// 十进制浮点数也可以有一个可选的指数（exponent)，通过大写或者小写的 e 来指定
    /// 十六进制浮点数必须有一个指数，通过大写或者小写的 p 来指定
    
    func Point3() {
        /// 12.1875
        let decimalDouble = 12.1875
        /// 12.1875
        let exponentDouble = 1.21875e1
        /// 12.1875
        let hexadecimalDouble = 0xC.3p0
        print(decimalDouble,exponentDouble,hexadecimalDouble)
    }
    
    /// 数值类字面量可以包括额外的格式来增强可读性。
    func Point4() {
        let paddedDouble = 000123.456
        let oneMillion = 1_000_000
        let justOverOneMillion = 1_000_000.000_000_1
        print(paddedDouble,oneMillion,justOverOneMillion)
    }
    
    // FIXME:整数和浮点数
    /// 整数和浮点数都可以添加额外的零并且包含下划线，并不会影响字面量
    
    // MARK: 1.8 =========================== 数值型类型转换
    
    /// 通常来讲，即使代码中的整数常量和变量已知非负，也请使用 Int 类型。
    /// 总是使用默认的整数类型可以保证你的整数常量和变量可以直接被复用并且可以匹配整数类字面量的类型推断。
    
    /// 只有在必要的时候才使用其他整数类型，比如要处理外部的长度明确的数据或者为了优化性能、内存占用等等。
    /// 使用显式指定长度的类型可以及时发现值溢出并且可以暗示正在处理特殊数据。

    // MARK: 1.8.1 =========================== 整数转换
    
    /// UInt8 类型不能存储负数，所以会报错
    /// let cannotBeNegative: UInt8 = -1
    
    /// Int8 类型不能存储超过最大值的数，所以会报错
    /// let tooBig: Int8 = Int8.max + 1
    
    func Point5() {
        print("=========================== 整数转换")
        let twoThousand: UInt16 = 2
        let one: UInt8 = 1
        /* 要将一种数字类型转换成另一种，你要用当前值来初始化一个期望类型的新数字，
        这个数字的类型就是你的目标类型。*/
        let twoThousandAndOne = twoThousand + UInt16(one)
        print(twoThousandAndOne)
    }
    
    // MARK: 1.8.2 =========================== 整数和浮点数转换
    
    func Point6() {
        print("=========================== 整数和浮点数转换")
        let three = 3
        let pointOneFourOneFiveNine = 0.14159
        let pi1 = Double(three) + pointOneFourOneFiveNine
        /// pi 等于 3.14159，所以被推测为 Double 类型
        let pi2 = 3 + 0.14159
        print(pi1,pi2)
    }
    
    // FIXME:整数和浮点数转换
    /// 字面量 3 可以直接和字面量 0.14159 相加，
    /// 因为数字字面量本身没有明确的类型。它们的类型只在编译器需要求值的时候被推测
    
    
    // MARK: 1.9 =========================== 类型别名
    func Point7() {
        print("=========================== 类型别名")
        typealias AudioSample = UInt16
        let maxAmplitudeFound = AudioSample.min
        /// maxAmplitudeFound 现在是 0
        print(maxAmplitudeFound)
    }
    
    // MARK: 1.10 =========================== 布尔值
    func Point8() {
        _ = true
        _ = false
        /// 这个例子不会通过编译，会报错
//        let i = 1
//        if i {
//        }
        
        /// 这个例子会编译成功
        let k = 1
        if k == 1 {
        }
    }
    
}
