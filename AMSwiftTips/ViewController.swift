//
//  ViewController.swift
//  AMSwiftTips
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
        AMBasicsPart1().setup()
        AMBasicsPart2().setup()
        AMBasicsPart3().setup()
        AMBasicsPart4().setup()
        
        //基本运算符
        AMBasicsOperatorPart1().setup()
        AMBasicsOperatorPart2().setup()

        //字符串和字符
        AMStringPart1().setup()
        AMStringPart2().setup()

        // 集合类型
        AMSetPart1().setup()
        AMSetPart2().setup()
        AMSetPart3().setup()

        // 控制流
        AMIfPart1().setup()
        AMIfPart2().setup()

        // 函数
        AMFunctionPart1().setup()
        AMFunctionPart2().setup()

        // 闭包
        AMBlocksPart1().setup()
        AMBlocksPart2().setup()

        // 枚举
        AMEnumPart1().setup()

        // 类和结构体
        AMClassAndStructPart1().setup()

        // 属性
        AMPropertyPart1().setup()
        AMPropertyPart2().setup()

        // 方法
        AMMethodsPart1().setup()

        // 下标
        AMSubscriptPart1().setup()

        // 继承
        AMInheritPart1().setup()

        // 构造过程
        AMInitPart1().setup()
        AMInitPart2().setup()
        AMInitPart3().setup()

        // 析构过程
        AMDeinitPart3().setup()

        // 可选链
        AMOptionalPart1().setup()

        // 错误处理
        AMErrorPart1().setup()

        // 类型转换
        AMAsPart1().setup()

        // 扩展
        AMExtensionPart1().setup()

        // 协议
        AMProtocolPart1().setup()
        AMProtocolPart2().setup()
        AMProtocolPart3().setup()
        AMProtocolPart4().setup()
        
        // 琐碎知识点
        AMTrivialPart().setup()
        
        // 参考：https://swiftgg.gitbook.io/swift/huan-ying-shi-yong-swift
        AMSwiftTips1().setup()
        AMSwiftTips2().setup()
        AMSwiftTips3().setup()
        AMSwiftTips4().setup()
        AMSwiftTips5().setup()
        AMSwiftTips6().setup()
    }
}

