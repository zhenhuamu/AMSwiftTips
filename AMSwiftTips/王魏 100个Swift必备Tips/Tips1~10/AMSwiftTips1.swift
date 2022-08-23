//
//  AMSwiftTips1.swift
//  AMSwiftTips
//
//  Created by mu on 2022/8/22.
//

import Foundation
import UIKit

class AMSwiftTips1 {
    
    func setup() {
        point()
        point1()
        point2()
    }

    //MARK: - 柯里化(Currying)

    /// Swift里可以把方法进行柯里化， 这也就是把接受多个参数的方法进行一些列变形，使其更加灵活的方法。
    func point() {
        print("=============================MARK: - 柯里化(Currying)")
        print("\(type(of: addTo(2))) ==== \(addTo(2)(3))")
        print("\(type(of: addTo(2))) ==== \(addTo(2)(4))")
        
        let greaterThan10 = greaterThan(comparer: 10)
        print(greaterThan10(13))
        print(greaterThan10(8))
        
    }
    
    func point1() {
        let control = Control()
        
        control.setTarget(target: self, action: AMSwiftTips1.tapAction, controlEvent: .TouchUpInside)
        control.performActionForControlEvent(controlEvent: .TouchUpInside)
    }
    
    func tapAction() {
        print("单击了")
    }
    
}

//MARK: - 简单实例1

/// 表达内容非常有限，如果我们需要一个将输入的数字加2，或者加3的函数，
/// 可能需要定义返回为 num + 2 、 num + 3 的函数
func addOne(num:Int) -> Int {
    return num + 1
}

func addTo(_ adder:Int) -> (Int) -> Int {
    return {
        num in
        return num + adder
    }
}

func greaterThan(comparer: Int) -> (Int) -> Bool {
    return { $0 > comparer }
}


//MARK: - Target Action 实例

protocol TargetAction {
    func performAction()
}

struct TargetActionWrapper<T: AnyObject>: TargetAction {
    weak var target: T?
    
    /// 柯里化
    let action: (T) -> () -> ()
    
    func performAction() -> () {
        if let t = target {
            action(t)()
        }
    }
}

enum ControlEvent {
    case TouchUpInside
    case ValueChanged
    // ...
}

class Control {

    var actions = [ControlEvent: TargetAction]()
    
    func setTarget<T: AnyObject>(target: T, action: @escaping (T) -> () -> (), controlEvent: ControlEvent) {
        actions[controlEvent] = TargetActionWrapper(target: target, action: action)
    }
    
    func removeTargetForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent] = nil
    }
    
    func performActionForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent]?.performAction()
    }
}

//MARK: - Swift 4.0 废弃的柯里化

/// https://github.com/apple/swift-evolution/blob/master/proposals/0002-remove-currying.md

// Before:
//func curried1(x: Int)(y: String) -> Float {
//  return Float(x) + Float(y)!
//}

// After:
func curried2(x: Int) -> (String) -> Float {
//    return {(y: String) -> Float in
//      return Float(x) + Float(y)!
//    }
    /// 简化版本
    return {
      y in
        return Float(x) + Float(y)!
    }
}

func point2() {
    print(curried2(x: 2)("3"))
}
