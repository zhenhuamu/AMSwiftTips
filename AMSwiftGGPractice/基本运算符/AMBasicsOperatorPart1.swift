//
//  AMBasicsOperatorPart1.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/13.
//

import Foundation

class AMBasicsOperatorPart1 {
    func SetupTest() {
        Test()
        Test1()
        Test2()
        Test3()
        Test4()
        Test5()
    }
    
    // MARK: 1.1 =========================== 赋值运算符
    func Test() {
        let b = 10
        var a = 5
        a = b
        print(a)
        // a 现在等于 10
        
        let (x, y, z) = (1, 2, 3)
        // 现在 x 等于 1，y 等于 2，z 等于 3
        print(x,y,z)
        
        // 与 C 语言和 Objective-C 不同，Swift 的赋值操作并不返回任何值。所以下面语句是无效的：
//        if x = y {
            // 此句错误，因为 x = y 并不返回任何值
//        }
    }
    
    // MARK: 1.2 =========================== 算术运算符
    /* 加法（+）
    减法（-）
    乘法（*）
    除法（/）*/
    func Test1() {
        _ = 1 + 2       // 等于 3
        _ = 5 - 3       // 等于 2
        _ = 2 * 3       // 等于 6
        _ = 10.0 / 2.5  // 等于 4.0
        _ = "hello, " + "world"  // 等于 "hello, world"
        // 与 C 语言和 Objective-C 不同的是，Swift 默认情况下不允许在数值运算中出现溢出情况
    }
    
    // MARK: 1.3 =========================== 求余运算符
    // 求余运算符（a % b）是计算 b 的多少倍刚刚好可以容入 a，返回多出来的那部分（余数）。
    func Test2() {
        _ = 9 % 4    // 等于 1
        _ = -9 % 4   // 等于 -1
        // 在对负数 b 求余时，b 的符号会被忽略。这意味着 a % b 和 a % -b 的结果是相同的。
    }
    
    // MARK: 1.4 =========================== 一元负号运算符 & 一元正号运算符 & 组合赋值运算符
    func Test3() {
        let three = 3
        let minusThree = -three       // minusThree 等于 -3
        let plusThree = -minusThree   // plusThree 等于 3, 或 "负负3"
        print(plusThree)
        // 一元负号符（-）写在操作数之前，中间没有空格。
        
        let minusSix = -6
        let alsoMinusSix = +minusSix  // alsoMinusSix 等于 -6
        print(alsoMinusSix)
        // 一元正号符（+）不做任何改变地返回操作数的值：
        
        var a = 1
        a += 2
        print(a)
        // a 现在是 3
        // 复合赋值运算没有返回值，let b = a += 2 这类代码是错误。这不同于上面提到的自增和自减运算符。
    }
    
    // MARK: 1.5 =========================== 比较运算符
    /* 等于（a == b）
    不等于（a != b）
    大于（a > b）
    小于（a < b）
    大于等于（a >= b）
    小于等于（a <= b）*/
    // Swift 也提供恒等（===）和不恒等（!==）这两个比较符来判断两个对象是否引用同一个对象实例
    func Test4() {
        let name = "world"
        if name == "world" {
            print("hello, world")
        } else {
            print("I'm sorry \(name), but I don't recognize you")
        }
        // 输出“hello, world", 因为 `name` 就是等于 "world”
        
        /*如果两个元组的元素相同，且长度相同的话，元组就可以被比较。
         比较元组大小会按照从左到右、逐值比较的方式，直到发现有两个值不等时停止。
         如果所有的值都相等，那么这一对元组我们就称它们是相等的 */
        
        _ = (1, "zebra") < (2, "apple")   // true，因为 1 小于 2
        _ = (3, "apple") < (3, "bird")    // true，因为 3 等于 3，但是 apple 小于 bird
        _ = (4, "dog") == (4, "dog")      // true，因为 4 等于 4，dog 等于 dog
        // _ = ("blue", false) < ("purple", true) // 错误，因为 < 不能比较布尔类型
        
        /* Swift 标准库只能比较七个以内元素的元组比较函数。
        如果你的元组元素超过七个时，你需要自己实现比较运算符。*/
    }
    
    // MARK: 1.6 =========================== 三元运算符
    func Test5() {
        /*三元运算符的特殊在于它是有三个操作数的运算符，它的形式是 问题 ? 答案 1 : 答案 2。
         它简洁地表达根据 问题成立与否作出二选一的操作。如果 问题 成立，返回 答案 1 的结果；
         反之返回 答案 2 的结果。*/
        let contentHeight = 40
        let hasHeader = true
        let rowHeight = contentHeight + (hasHeader ? 50 : 20)
        // rowHeight 现在是 90
        print(rowHeight)
        
        /*三元运算为二选一场景提供了一个非常便捷的表达形式。
         不过需要注意的是，滥用三元运算符会降低代码可读性。
         所以我们应避免在一个复合语句中使用多个三元运算符。*/
    }
    
}
