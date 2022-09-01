//
//  AMSwiftTips4.swift
//  AMSwiftTips
//
//  Created by mu on 2022/8/30.
//

import Foundation

class AMSwiftTips4 {
    func setup() {
        print("=========================== MARK: - 协议扩展 默认属性值")
        point()
        point1()
        point2()
        point3()
    }
    
    //MARK: - 协议扩展 默认属性值
    /// 问题1
    /// 通过提供协议并且进行协议扩展进行属性默认值的设置，
    /// 在没有设置值的时候使用默认值，在进行值设置之后使用设置之后的值
    
    /// ⚠️⚠️⚠️  但是这是不太好处理的，因为协议扩展不能添加存储的属性 如实例1
    
    func point() {
        var a = A()
        a.name = "小明"
        /// 打印的值还是之前的默认值default
        print(a.name)
    }
    
    //MARK: - 3种解决方案
    
    //MARK: - 面向对象编程
    func point1() {
        let a = A1()
        a.name  = "面向对象编程"
        print(a.name)
    }
    
    //MARK: - 面向协议编程
    func point2() {
        var a = A2()
        a.identifiableComponent.name = "面向协议编程"
        print(a.identifiableComponent.name)
    }
    
    //MARK: - 与Objective-C相关的对象
    func point3() {
        let a = A3()
        print(a.id)    // 0
        print(a.name)  // default
        a.id = 5
        a.name = "changed"
        print(a.id)    // 5
        print(a.name)  // changed
    }
    
    //MARK: - 总结
    /// 协议和协议扩展功能非常强大，但是它们对于只读属性和功能往往最有用。
    /// 对于您要完成的工作（具有默认值的存储属性），类和继承实际上可能是更优雅的解决方案
    
}

//MARK: - 实例1

protocol Identifiable {
    var id: Int {get set}
    var name: String {get set}
}

extension Identifiable {
    var id: Int {
        get {
            0
        }
        set {
        }
    }

    var name: String {
        get {
            "default"
        }
        set {
        }
    }
}

struct A: Identifiable {
    
}

struct B: Identifiable {
    
}

//MARK: - 解决方案一（面向对象编程）

class IdentifiableBase {
    var id = 0
    var name = "default"
}

class A1: IdentifiableBase {
}

//MARK: - 解决方案二（面向协议编程）

struct IdentifiableComponent {
    var id = 0
    var name = "default"
}

protocol HasIdentifiableComponent {
    var identifiableComponent: IdentifiableComponent { get set }
}

protocol Identifiable1: HasIdentifiableComponent { }

extension Identifiable1 {
    var id: Int {
        get { return identifiableComponent.id }
        set { identifiableComponent.id = newValue }
    }
    var name: String {
        get { return identifiableComponent.name }
        set { identifiableComponent.name = newValue }
    }
}

struct A2: Identifiable1 {
    var identifiableComponent = IdentifiableComponent()
}

//MARK: - 解决方案三（与Objective-C相关的对象）

protocol Identifiable3: NSObjectProtocol {
    var id: Int { get set }
    var name: String { get set }
}

var IdentifiableIdKey   = "kIdentifiableIdKey"
var IdentifiableNameKey = "kIdentifiableNameKey"

extension Identifiable3 {
    var id: Int {
        get {
            return (objc_getAssociatedObject(self, &IdentifiableIdKey) as? Int) ?? 0
        }
        set {
            objc_setAssociatedObject(self, &IdentifiableIdKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    var name: String {
        get {
            return (objc_getAssociatedObject(self, &IdentifiableNameKey) as? String) ?? "default"
        }
        set {
            objc_setAssociatedObject(self, &IdentifiableNameKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

class A3:NSObject, Identifiable3 {

}
