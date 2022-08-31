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
        
        ///⚠️⚠️⚠️⚠️
        ///@autoclosure 并不支持带有输入参数的写法，也就是说只有形如 () -> T 的参数才能使用这个特性进行简化
        
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

/**
 
 fun ??<T>(optional:T?, @autoclosure defaultValue:() -> T) -> T {
     switch optional {
     case .Some(let value):
         return value
     case .None:
         return defaultValue()
     }
 }
 
 疑问1 直接接受T作为参数并返回不行吗？
 
 如果直接使用T，那么就意味这在 ?? 操作符真正取值之前，我们就必须准备好一个默认值传入到这个方法中
 一般来说这不会有很大问题，但是如果这个默认值是通过一系列复杂计算得到的话，可能会成为浪费，因为其实如果optional
 不是nil的话，我们实际上是完全没有用到这个默认值
 
 */


