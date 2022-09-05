//
//  AMSwiftTips5.swift
//  AMSwiftTips
//
//  Created by mu on 2022/9/5.
//

import Foundation

class AMSwiftTips5 {
    func setup() {
        print("=========================== MARK: - 操作符")
        point()
        point1()
    }
    
    func point() {
        //MARK: - 笨拙的方式
        let v1 = Vector2D(x: 2.0, y: 3.0)
        let v2 = Vector2D(x: 1.0, y: 4.0)
        let v3 = Vector2D(x: v1.x + v2.x, y: v1.y + v2.y)
        print(v3)
    }
    
    func point1() {
        //MARK: - 重载运算符的方式
        let v4 = Vector2D(x: 2.0, y: 3.0)
        let v5 = Vector2D(x: 1.0, y: 4.0)
        let v6 = v4 + v5
        print(v6)
        
        let v7 = v4 +* v5
        print(v7)
        
    }
    
    
}

struct Vector2D {
    var x = 0.0
    var y = 0.0
    
    /// 重载加号操作符
    /// 对于加号、减号、负号都已经存在与Swift中的运算符，我们只需要变换它的参数进行重载即可
    
    static func +(left:Vector2D, right:Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
    
    //MARK: - func 运算符() -> 返回值 {}  定义该运算符的函数功能

    /// 如果要定义全新的运算符需要做更多的事
    static func +*(left:Vector2D, right:Vector2D) -> Vector2D {
        return Vector2D(x: left.x * right.x, y: left.y * right.y)
    }
    
}

//MARK: - infix|prefix|postfix operator 运算符 : 优先级描述符

// infix|prefix|postfix 代表了操作符的个数;
// infix为需要两个操作符，prefix代表左操作符(类似++a) postfix代表右操作符(类似a++)

// operator 关键字 重载

// 运算符 要定义的自定义运算符，例如 -->、+*、等

// : 这里的冒号不可少

// 优先级描述符 代表了该运算符的优先级，可以使用系统内置的优先级描述符例如AdditionPrecedence(和加减法优先级一样)、
// MultiplicationPrecedence(和乘除法优先级一样)，
// 也可以使用自定义的优先级描述符，自定义语法如下：

//        precedencegroup InnerProductPrecedence {
//            associativity: none
//            higherThan: MultiplicationPrecedence, AdditionPrecedence
//        }

// precedencegroup：自定义优先级的关键字
// InnerProductPrecedence：自定义优先级名
// associativity：是否允许结合律，可取值为none、left。
// none代表只允许两个操作数计算，
// left代表如果多个同类的操作符顺序出现那么按照从左往右的顺序计算(例如加法,减法)
// higherThan：代表其优先级要高于某个优先级

infix operator +* : ExampleProductPrecedence

precedencegroup ExampleProductPrecedence {
    associativity: none
    higherThan: MultiplicationPrecedence, AdditionPrecedence
}

    

