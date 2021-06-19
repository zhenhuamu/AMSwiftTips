//
//  AMBasicsPart4.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/13.
//

import Foundation

class AMBasicsPart4 {
    func SetupTest() {
        Test1()
        Test2()
        Test3()
    }
    
    // MARK: 1.13 =========================== 错误处理
    
    /// 你可以使用 错误处理（error handling） 来应对程序执行中可能会遇到的错误条件。
    /// 相对于可选中运用值的存在与缺失来表达函数的成功与失败，错误处理可以推断失败的原因，并传播至程序的其他部分。
    
    func makeASandwich() throws {
        /// ...
    }

    func Test1() {
        do {
            try makeASandwich()
            /// 没有错误消息抛出
        } catch {
            /// 有一个错误消息抛出
        }
    }
    
    // MARK: 1.14 =========================== 断言和先决条件
    
    /// 断言和先决条件是在运行时所做的检查。你可以用他们来检查在执行后续代码之前是否一个必要的条件已经被满足了。
    /// 如果断言或者先决条件中的布尔条件评估的结果为 true（真），则代码像往常一样继续执行。
    /// 如果布尔条件评估结果为 false（假），程序的当前状态是无效的，则代码执行结束，应用程序中止。
    
    /// 断言和先决条件的不同点是，他们什么时候进行状态检测：
    /// 断言仅在调试环境运行，而先决条件则在调试环境和生产环境中运行。
    /// 在生产环境中，断言的条件将不会进行评估。
    /// 这个意味着你可以使用很多断言在你的开发阶段，但是这些断言在生产环境中不会产生任何影响。
    
    // MARK: 1.14.1 =========================== 使用断言进行调试
    
    func Test2() {
        let age = 3
        /// Swift 标准库的 assert(_:_:file:line:) 函数来写一个断言。
        /// 向这个函数传入一个结果为 true 或者 false 的表达式以及一条信息，当表达式的结果为 false 的时候这条信息会被显示
        
        /// 因为 age < 0，所以断言会触发
        assert(age >= 0, "A person's age cannot be less than zero")
        
        /// 如果代码已经检查了条件，你可以使用 assertionFailure(_:file:line:) 函数来表明断言失败了
        if age > 10 {
            print("You can ride the roller-coaster or the ferris wheel.")
        } else if age > 0 {
            print("You can ride the ferris wheel.")
        } else {
            assertionFailure("A person's age can't be less than zero.")
        }
    }

    // MARK: 1.14.2 =========================== 强制执行先决条件
    
    func Test3() {
        let index = 10
        
        /// 你可以使用全局 precondition(_:_:file:line:) 函数来写一个先决条件。
        /// 向这个函数传入一个结果为 true 或者 false 的表达式以及一条信息，当表达式的结果为 false 的时候这条信息会被显示：
    
        /// 在一个下标的实现里...
        precondition(index > 0, "Index must be greater than zero.")
    }
    
}
