//
//  AMSwiftTips6.swift
//  AMSwiftTips
//
//  Created by mu on 2022/9/5.
//

import Foundation

class AMSwiftTips6 {
    func setup() {
        print("=========================== MARK: - func 的参数修饰")
        var temp = 4
        print(incrementor2(variable: &temp))
    }
    
    /// 默认情况下所有的参数都是let的
    /// Cannot find operator '++' in scope; did you mean '+= 1'?
//    func incrementor1(/**let*/ variable: Int) -> Int {
//        return ++ variable
//    }
    
    func incrementor2(variable: inout Int) -> Int {
        variable += 1
        return variable
    }
    
}
