//
//  AMStringPart2.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/15.
//

import Foundation

class AMStringPart2 {
    func SetupTest() {
        Test()
    }
    
    // MARK: 1.1 =========================== 字符串插值
    func Test() {
        let multiplier = 3
        let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
        // message 是 "3 times 2.5 is 7.5"
        print(message)
        /* 插值字符串中写在括号中的表达式不能包含非转义反斜杠（\），
        并且不能包含回车或换行符。不过，插值字符串可以包含其他字面量。*/
    }
    
    // MARK: 1.2 =========================== Unicode
    
    // MARK: 1.3 =========================== 计算字符数量
    
    // MARK: 1.4 =========================== 访问和修改字符串
    
    // MARK: 1.5 =========================== 子字符串
    
    // MARK: 1.6 =========================== 比较字符串

}
