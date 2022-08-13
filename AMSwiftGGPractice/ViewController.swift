//
//  ViewController.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/12.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 参考：https://swiftgg.gitbook.io/swift/huan-ying-shi-yong-swift
        
        //基础部分
        AMBasicsPart1().SetupTest()
        AMBasicsPart2().SetupTest()
        AMBasicsPart3().SetupTest()
        AMBasicsPart4().SetupTest()
        
        //基本运算符
        AMBasicsOperatorPart1().SetupTest()
        AMBasicsOperatorPart2().SetupTest()

        //字符串和字符
        AMStringPart1().SetupTest()
        AMStringPart2().SetupTest()

        // 集合类型
        AMSetPart1().SetupTest()
        AMSetPart2().SetupTest()
        AMSetPart3().SetupTest()

        // 控制流
        AMIfPart1().SetupTest()
        AMIfPart2().SetupTest()

        // 函数
        AMFunctionPart1().SetupTest()
        AMFunctionPart2().SetupTest()

        // 闭包
        AMBlocksPart1().SetupTest()
        AMBlocksPart2().SetupTest()

        // 枚举
        AMEnumPart1().SetupTest()

        // 类和结构体
        AMClassAndStructPart1().SetupTest()

        // 属性
        AMPropertyPart1().SetupTest()
        AMPropertyPart2().SetupTest()
//
//        // 方法
//        AMMethodsPart1().SetupTest()
//
//        // 下标
//        AMSubscriptPart1().SetupTest()
//
//        // 继承
//        AMInheritPart1().SetupTest()
//
//        // 构造过程
//        AMInitPart1().SetupTest()
//        AMInitPart2().SetupTest()
//        AMInitPart3().SetupTest()
//
//        // 析构过程
//        AMDeinitPart3().SetupTest()
//
//        // 可选链
//        AMOptionalPart1().SetupTest()
//
//        // 错误处理
//        AMErrorPart1().SetupTest()
//
//        // 类型转换
//        AMAsPart1().SetupTest()
//
//        // 扩展
//        AMExtensionPart1().SetupTest()
//
//        // 协议
//        AMProtocolPart1().SetupTest()
//        AMProtocolPart2().SetupTest()
//        AMProtocolPart3().SetupTest()
//        AMProtocolPart4().SetupTest()
    }
}

