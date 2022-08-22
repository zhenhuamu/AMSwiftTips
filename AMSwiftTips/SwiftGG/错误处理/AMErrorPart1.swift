//
//  AMErrorPart1.swift
//  AMSwiftTips
//
//  Created by AndyMu on 2020/10/24.
//

import Foundation

class AMErrorPart1 {

    func SetupTest() {
        Test()
    }
    
    ///-------------------------标示与抛出错误-----------------------------///
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
