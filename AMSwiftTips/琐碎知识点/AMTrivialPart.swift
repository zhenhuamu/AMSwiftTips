//
//  AMTrivialPart.swift
//  AMSwiftTips
//
//  Created by mu on 2022/8/14.
//

import Foundation

class AMTrivialPart {
    
    var str:String = ""
    var conplentionBlock:(() -> ())?
    
    func SetupTest() {
        test()
        test1()
        test2()
    }
    // MARK: 1.1 =========================== {} 包装代码 （）是表示执行
    func test() {
        var _:String = {
            let string = "123"
            return string
        }()
    }
    
    // MARK: 1.2 =========================== 解除循环引用的三种方式
    func test1() {
        
        
        /// 方法一:OC方式
        /// var( weak 只能修饰 var ,不能修饰 let)
        /// weak可能会被在运行时被修饰 -> 指向的对象一旦被释放，会被自动设置为nil
        weak var weakSelf = self
            loadData {
                print(weakSelf?.str ?? "")
            }
        
        /// 方法二:Swift推荐方法
        /// [weak self] 表示 {} 中的所有 self 都是弱引用，需要注意解包
            loadData  { [weak self] in
                guard let weakSelf = self else { return }
                print(weakSelf.str)
            }
        
        /// 方法三:Swift 的另外一个用法
        /// [unowned self] 表示 {} 中的所有 self 都是assign，不会强引用。
        /// 但是如果对象释放，指针的地址不会变化，继续调用，就会出现野指针的问题
            loadData { [unowned self] in
//                print(self.str)
            }
        
    }

    // MARK: 1.3 =========================== Swift 中.self和 type(of:)
    func test2() {
        let temp1 = AMAsPart1.self
        let temp2 = AMAsPart1().self
        print("\(temp1)=====\(temp2)")
        /// 输出 AMAsPart1=====AMSwiftTips.AMAsPart1
        let classString = NSStringFromClass(temp1)
        print(classString)
        /// 输出 AMSwiftTips.AMAsPart1
        
        let temp3 = type(of: AMAsPart1.self)
        let temp4 = type(of: AMAsPart1().self)
        
        print("\(temp3)=====\(temp4)")
        /// 输出AMAsPart1=====AMAsPart1.Type
        let classString1 = NSStringFromClass(temp4)
        print(classString1)
        /// 输出 AMSwiftTips.AMAsPart1
        
        let temp5 = 90
        print("\(temp5)======\(temp5.self)")
        /// 输出90======90
        print(type(of: temp5))
        /// Int
        
    }
    
    
    
    /// 请求模拟
    func loadData(complention: @escaping () -> ()) -> () {
        /// 使用属性记录闭包 -> self 对闭包引用了
        conplentionBlock = complention
        DispatchQueue.global().async {
            /// 耗时操作
            Thread.sleep(forTimeInterval: 2)
            DispatchQueue.main.async(execute: {
                /// 回调，执行闭包
                complention()
            })
        }
    }
    
}



