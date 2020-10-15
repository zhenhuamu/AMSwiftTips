//
//  AMBasicsPart4.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/13.
//

import Foundation

class AMBasicsPart4 {
    func SetupTest() {
        Test()
        Test1()
    }
    ///--------------------------隐式解析可选类型-----------------------------///
    func Test() {
        let possibleString: String? = "An optional string."
        let forcedString: String = possibleString! // 需要感叹号来获取值
        print(forcedString)
        let assumedString: String! = "An implicitly unwrapped optional string."
        let implicitString: String = assumedString  // 不需要感叹号
        print(implicitString)
        /* 如果你在隐式解析可选类型没有值的时候尝试取值，会触发运行时错误。
         和你在没有值的普通可选类型后面加一个惊叹号一样。*/
        
        
        /* 如果一个变量之后可能变成 nil 的话请不要使用隐式解析可选类型。
         如果你需要在变量的生命周期中判断是否是 nil 的话，请使用普通可选类型。*/
    }
    ///--------------------------断言和先决条件-----------------------------///
    /*断言和先决条件是在运行时所做的检查。你可以用他们来检查在执行后续代码之前是否一个必要的条件已经被满足了。
     如果断言或者先决条件中的布尔条件评估的结果为 true（真），则代码像往常一样继续执行。
     如果布尔条件评估结果为 false（假），程序的当前状态是无效的，则代码执行结束，应用程序中止。*/
    
    /*断言和先决条件的不同点是，他们什么时候进行状态检测：
     断言仅在调试环境运行，而先决条件则在调试环境和生产环境中运行。
     在生产环境中，断言的条件将不会进行评估。
     这个意味着你可以使用很多断言在你的开发阶段，但是这些断言在生产环境中不会产生任何影响。*/
    func Test1() {
        let age = 3
        /* Swift 标准库的 assert(_:_:file:line:) 函数来写一个断言。
         向这个函数传入一个结果为 true 或者 false 的表达式以及一条信息，当表达式的结果为 false 的时候这条信息会被显示：*/
        assert(age >= 0, "A person's age cannot be less than zero")
        // 因为 age < 0，所以断言会触发
        
        // 如果代码已经检查了条件，你可以使用 assertionFailure(_:file:line:) 函数来表明断言失败了
        if age > 10 {
            print("You can ride the roller-coaster or the ferris wheel.")
        } else if age > 0 {
            print("You can ride the ferris wheel.")
        } else {
            assertionFailure("A person's age can't be less than zero.")
        }
        
        let index = 10
        
        /* 你可以使用全局 precondition(_:_:file:line:) 函数来写一个先决条件。向这个函数传入一个结果为 true 或者 false 的表达式以及一条信息，当表达式的结果为 false 的时候这条信息会被显示：*/
        // 在一个下标的实现里...
        precondition(index > 0, "Index must be greater than zero.")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
