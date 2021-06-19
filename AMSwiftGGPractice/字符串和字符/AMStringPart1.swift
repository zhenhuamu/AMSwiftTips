//
//  AMStringPart1.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/15.
//

import Foundation

class AMStringPart1 {
    func SetupTest() {
        Test()
        Test1()
        Test2()
        Test3()
        Test4()
    }
    
    // MARK: 1.1 =========================== 字符串字面量
    func Test() {
        // 字符串字面量
        let someString = "Some string literal value"
        print(someString)
        // 多行字符串字面量
        let quotation = """
        The White Rabbit put on his spectacles.  "Where shall I begin,
        please your Majesty?" he asked.

        "Begin at the beginning," the King said gravely, "and go on
        till you come to the end; then stop."
        """
        print(quotation)
        
        /* 如果你的代码中，多行字符串字面量包含换行符的话，则多行字符串字面量中也会包含换行符。
        如果你想换行，以便加强代码的可读性，但是你又不想在你的多行字符串字面量中出现换行符的话，
        你可以用在行尾写一个反斜杠（\）作为续行符。*/
        let softWrappedQuotation = """
        The White Rabbit put on his spectacles.  "Where shall I begin, \
        please your Majesty?" he asked.

        "Begin at the beginning," the King said gravely, "and go on \
        till you come to the end; then stop."
        """
        print(softWrappedQuotation)
        
        // 为了让一个多行字符串字面量开始和结束于换行符，请将换行写在第一行和最后一行
        let lineBreaks = """

        This string starts with a line break.
        It also ends with a line break.

        """
        print(lineBreaks)
    }
    
    // MARK: 1.2 =========================== 字符串字面量的特殊字符
    
    // MARK: 1.3 =========================== 扩展字符串分隔符
    
    // MARK: 1.4 =========================== 初始化空字符串
    func Test1() {
        // 初始化空字符串
        let emptyString = ""               // 空字符串字面量
        let anotherEmptyString = String()  // 初始化方法
        // 两个字符串均为空并等价。
        // 你可以通过检查 Bool 类型的 isEmpty 属性来判断该字符串是否为空
        if emptyString.isEmpty || anotherEmptyString.isEmpty {
            print("Nothing to see here")
        }
        // 打印输出：“Nothing to see here”
    }
    
    // MARK: 1.5 =========================== 字符串可变性
    func Test2() {
        var variableString = "Horse"
        variableString += " and carriage"
        // variableString 现在为 "Horse and carriage"

//        let constantString = "Highlander"
//        constantString += " and another Highlander"
        // 这会报告一个编译错误（compile-time error） - 常量字符串不可以被修改。
    }
    
    // MARK: 1.6 =========================== 使用字符
    func Test3() {
        // 你可通过 for-in 循环来遍历字符串，获取字符串中每一个字符的值：
        for character in "Dog!🐶" {
            print(character)
        }
        // D
        // o
        // g
        // !
        // 🐶
        
        // 通过标明一个 Character 类型并用字符字面量进行赋值，可以建立一个独立的字符常量或变量：
        let exclamationMark: Character = "!"
        print(exclamationMark)
        
        // 字符串可以通过传递一个值类型为 Character 的数组作为自变量来初始化：
        let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
        let catString = String(catCharacters)
        print(catString)
        // 打印输出：“Cat!🐱”
    }
    
    // MARK: 1.7 =========================== 连接字符串和字符
    func Test4() {
        let string1 = "hello"
        let string2 = " there"
        var welcome = string1 + string2
        // welcome 现在等于 "hello there"
        print(welcome)
        var instruction = "look over"
        instruction += string2
        // instruction 现在等于 "look over there"
        print(instruction)
        let exclamationMark: Character = "!"
        welcome.append(exclamationMark)
        print(welcome)
        // welcome 现在等于 "hello there!"
        // 你不能将一个字符串或者字符添加到一个已经存在的字符变量上，因为字符变量只能包含一个字符。
    }
    
    
    
}
