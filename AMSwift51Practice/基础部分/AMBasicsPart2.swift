//
//  AMBasicsPart2.swift
//  AMSwift51Practice
//
//  Created by AndyMu on 2020/10/12.
//

import Foundation

class AMBasicsPart2: NSObject {
    func SetupTest() {
        Test()
    }
    ///-----------------------------类型安全 & 类型推断-----------------------------///
    let meaningOfLife = 42
    // meaningOfLife 会被推测为 Int 类型
    let pi = 3.14159
    // pi 会被推测为 Double 类型
    // 当推断浮点数的类型时，Swift 总是会选择 Double 而不是 Float。
    let anotherPi = 3 + 0.14159
    // anotherPi 会被推测为 Double 类型
    // 原始值 3 没有显式声明类型，而表达式中出现了一个浮点字面量，所以表达式会被推断为 Double 类型
    
    ///-----------------------------整数字面量-----------------------------///
    
    // 整数字面量可以被写作：
    // 一个十进制数，没有前缀
    // 一个二进制数，前缀是 0b
    // 一个八进制数，前缀是 0o
    // 一个十六进制数，前缀是 0x
    
    let decimalInteger = 17
    let binaryInteger = 0b10001       // 二进制的17
    let octalInteger = 0o21           // 八进制的17
    let hexadecimalInteger = 0x11     // 十六进制的17
    func Test() {
        print(decimalInteger,binaryInteger,octalInteger,hexadecimalInteger)
    }
    
    /* 浮点字面量可以是十进制（没有前缀）或者是十六进制（前缀是 0x ）。
     小数点两边必须有至少一个十进制数字（或者是十六进制的数字）。
     十进制浮点数也可以有一个可选的指数（exponent)，通过大写或者小写的 e 来指定；
     十六进制浮点数必须有一个指数，通过大写或者小写的 p 来指定。*/
    
    let decimalDouble = 12.1875      //12.1875
    let exponentDouble = 1.21875e1   //12.1875
    let hexadecimalDouble = 0xC.3p0  //12.1875
    
    /* 数值类字面量可以包括额外的格式来增强可读性。
       整数和浮点数都可以添加额外的零并且包含下划线，并不会影响字面量：*/
    let paddedDouble = 000123.456
    let oneMillion = 1_000_000
    let justOverOneMillion = 1_000_000.000_000_1
    
    ///-----------------------------整数转换-----------------------------///
    
    
    
    
}
