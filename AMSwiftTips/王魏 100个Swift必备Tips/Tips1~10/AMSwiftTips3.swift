//
//  AMSwiftTips3.swift
//  AMSwiftTips
//
//  Created by mu on 2022/8/23.
//

import Foundation

class AMSwiftTips3 {
    
    func setup() {
        point()
        point1()
    }
    
    //MARK: - autoclosure 和 ??
    
    func point() {
        print("=========================== MARK: - autoclosure")
        // 方式一
        logIfTrue1(predicate: {return 2 > 1})
        // 方式二
        logIfTrue1(predicate: {2 > 1})
        // 方式三 尾随闭包
        logIfTrue1{2 > 1}
        
        // 表达式自动封装成闭包
        logIfTrue2(predicate: 2 > 1)
    }
    
    func point1() {
        print("=========================== MARK: - ??源码实现")
    }
    
}

 //MARK: - 实例1

func logIfTrue1(predicate:() -> Bool) {
    if predicate() {
        print("true")
    }
}

func logIfTrue2(predicate: @autoclosure () -> Bool) {
    if predicate() {
        print("true")
    }
}

//MARK: - ?? 源码实现

