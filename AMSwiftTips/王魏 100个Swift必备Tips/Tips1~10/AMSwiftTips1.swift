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
    }

    //MARK: - 柯里化(Currying)

    /// Swift里可以把方法进行柯里化， 这也就是把接受多个参数的方法进行一些列变形，使其更加灵活的方法。

    /// 表达内容非常有限，如果我们需要一个将输入的数字加2，或者加3的函数，
    /// 可能需要定义返回为 num + 2 、 num + 3 的函数
    func addOne(num:Int) -> Int {
        return num + 1
    }

    func addTo(adder:Int) -> (Int) -> Int {
        return {
            num in
            return num + adder
        }
    }

    func point() {
        let addTwo = addTo(adder: 2)
        print(addTwo(3))
        let result = addTo(adder: 2)
        print(result(4))
    }

    func greaterThan(comparer: Int) -> (Int) -> Bool {
        return { $0 > comparer }
    }
    
    func point1() {
        let greaterThan10 = greaterThan(comparer: 10)
        print(greaterThan10(13))
        print(greaterThan10(8))
    }
    
    func point2() {
        Control().setTarget(target: self, action: AMSwiftTips1.tapAction, controlEvent: .TouchUpInside)
    }
    
    func tapAction() {
        print("单击了")
    }
    
}

protocol TargetAction {
    func performAction()
}

struct TargetActionWrapper<T: AnyObject>: TargetAction {
    weak var target: T?
    let action: (T) -> () -> (Void)
    
    func performAction() -> (Void) {
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
    
    func setTarget<T: AnyObject>(target: T, action: @escaping (T) -> () -> (Void), controlEvent: ControlEvent) {
        actions[controlEvent] = TargetActionWrapper(target: target, action: action)
    }
    
    func removeTargetForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent] = nil
    }
    
    func performActionForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent]?.performAction()
    }
}
