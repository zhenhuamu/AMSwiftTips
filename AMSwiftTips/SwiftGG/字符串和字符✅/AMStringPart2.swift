//
//  AMStringPart2.swift
//  AMSwiftTips
//
//  Created by AndyMu on 2020/10/15.
//

import Foundation

class AMStringPart2 {
    func SetupTest() {
        Point1()
        Point2()
        Point3()
        Point4()
        Point5()
        Point6()
    }
    
    // MARK: 1.1 =========================== 字符串插值
    func Point1() {
        print("=========================== 字符串插值")
        let multiplier = 3
        let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
        print(message)
        // FIEME:⚠️⚠️⚠️字符串插值
        /* 插值字符串中写在括号中的表达式不能包含非转义反斜杠（\），
        并且不能包含回车或换行符。不过，插值字符串可以包含其他字面量。*/
    }
    
    // MARK: 1.2 =========================== Unicode
    func Point2() {
        print("=========================== Unicode")
        let eAcute: Character = "\u{E9}"
        let combinedEAcute: Character = "\u{65}\u{301}"
        let precomposed: Character = "\u{D55C}"
        let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
        let enclosedEAcute: Character = "\u{E9}\u{20DD}"
        let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
        print(eAcute,combinedEAcute,precomposed,decomposed,enclosedEAcute,regionalIndicatorForUS)
    }
    // MARK: 1.3 =========================== 计算字符数量
    func Point3() {
        print("=========================== 计算字符数量")
        let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
        print("unusualMenagerie has \(unusualMenagerie.count) characters")
        
        var word = "cafe"
        print("the number of characters in \(word) is \(word.count)")
        
        word += "\u{301}"
        print("the number of characters in \(word) is \(word.count)")
        // FIEME:⚠️⚠️⚠️计算字符数量
        // 另外需要注意的是通过 count 属性返回的字符数量并不总是与包含相同字符的 NSString 的 length 属性相同。NSString 的 length 属性是利用 UTF-16 表示的十六位代码单元数字，而不是 Unicode 可扩展的字符群集。
    }
    // MARK: 1.4 =========================== 访问和修改字符串
    func Point4() {
        print("=========================== 访问和修改字符串")
        let greeting = "Guten Tag!"
        let a = greeting[greeting.startIndex]
        print(a)
        let b = greeting[greeting.index(before: greeting.endIndex)]
        print(b)
        let c = greeting[greeting.index(after: greeting.startIndex)]
        print(c)
        let index = greeting.index(greeting.startIndex, offsetBy: 7)
        let d = greeting[index]
        print(d)
        for index in greeting.indices {
           print("\(greeting[index]) ", terminator: "")
        }
        
        var welcome = "hello"
        welcome.insert("!", at: welcome.endIndex)
        print(welcome)

        welcome.insert(contentsOf:" there", at: welcome.index(before: welcome.endIndex))
        print(welcome)
        
        welcome.remove(at: welcome.index(before: welcome.endIndex))
        print(welcome)

        let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
        welcome.removeSubrange(range)
        print(welcome)
        
        print("")
    }
    // MARK: 1.5 =========================== 子字符串
    func Point5() {
        print("=========================== 子字符串")
        let greeting = "Hello, world!"
        let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
        let beginning = greeting[..<index]
        // beginning 的值为 "Hello"
        print(beginning)
        // 把结果转化为 String 以便长期存储。
        let newString = String(beginning)
        print(newString)
        
        // FIEME:⚠️⚠️⚠️子字符串
        /// 每一个 Substring 都会在内存里保存字符集。
        /// 而 String 和 Substring 的区别在于性能优化上，Substring 可以重用原 String 的内存空间，或者另一个 Substring 的内存空间（String 也有同样的优化，但如果两个 String 共享内存的话，它们就会相等）。
        /// 这一优化意味着你在修改 String 和 Substring 之前都不需要消耗性能去复制内存。
        /// 就像前面说的那样，Substring 不适合长期存储 —— 因为它重用了原 String 的内存空间，原 String 的内存空间必须保留直到它的 Substring 不再被使用为止。
    }
    // MARK: 1.6 =========================== 比较字符串
    func Point6() {
        print("=========================== 比较字符串")
        let quotation = "We're a lot alike, you and I."
        let sameQuotation = "We're a lot alike, you and I."
        if quotation == sameQuotation {
            print("These two strings are considered equal")
        }
    
        // "Voulez-vous un café?" 使用 LATIN SMALL LETTER E WITH ACUTE
        let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

        // "Voulez-vous un café?" 使用 LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
        let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

        if eAcuteQuestion == combinedEAcuteQuestion {
            print("\(eAcuteQuestion)和\(combinedEAcuteQuestion) These two strings are considered equal")
        }
        
    }
}
