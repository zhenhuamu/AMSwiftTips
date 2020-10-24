//
//  AMErrorPart1.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/24.
//

import Foundation

class AMErrorPart1 {
    /* 错误处理（Error handling） 是响应错误以及从错误中恢复的过程。
    Swift 在运行时提供了抛出、捕获、传递和操作可恢复错误（recoverable errors）的一等支持（first-class support）。
    某些操作无法保证总是执行完所有代码或生成有用的结果。可选类型用来表示值缺失，但是当某个操作失败时，理解造成失败的原因有助于你的代码作出相应的应对*/
    func SetupTest() {
        Test()
    }
    
    ///-------------------------表示与抛出错误-----------------------------///
    func Test() {
        // 标示
        enum VendingMachineError: Error {
            case invalidSelection                       //选择无效
            case insufficientFunds(coinsNeeded: Int)    //金额不足
            case outOfStock                             //缺货
        }
        // 抛出
//        throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
    }
    
    ///-------------------------表示与抛出错误-----------------------------///
    func Test1() {
        
    }
    
    ///-------------------------表示与抛出错误-----------------------------///
    func Test2() {
        
    }
    
    ///-------------------------表示与抛出错误-----------------------------///
    func Test3() {
        
    }
    
    ///-------------------------表示与抛出错误-----------------------------///
    func Test4() {
        
    }
    
    
    
    
    
}
