//
//  AMSetPart1.swift
//  AMSwiftTips
//
//  Created by AndyMu on 2020/10/15.
//

import Foundation

class AMSetPart1 {
    func setup() {
        point()
        point1()
    }
    
    // MARK: 1.1 =========================== 数组
    func point() {
        print("=========================== 数组")
        var someInts = [Int]()
        print("someInts is of type [Int] with \(someInts.count) items.")
        // 打印“someInts is of type [Int] with 0 items.”
        
        someInts.append(3)
        // someInts 现在包含一个 Int 值
        someInts = []
        // someInts 现在是空数组，但是仍然是 [Int] 类型的。
        
        /* Swift 中的 Array 类型还提供一个可以创建特定大小并且所有数据都被默认的构造方法。
        可以把准备加入新数组的数据项数量（count）和适当类型的初始值（repeating）传入数组构造函数*/
        let threeDoubles = Array(repeating: 0.0, count: 3)
        // threeDoubles 是一种 [Double] 数组，等价于 [0.0, 0.0, 0.0]
        
        // 通过两个数组相加创建一个数组
        let anotherThreeDoubles = Array(repeating: 2.5, count: 3)
        // anotherThreeDoubles 被推断为 [Double]，等价于 [2.5, 2.5, 2.5]

        _ = threeDoubles + anotherThreeDoubles
        // sixDoubles 被推断为 [Double]，等价于 [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
        
        //用数组字面量构造数组
        var shoppingList: [String] = ["Eggs", "Milk"]
        // shoppingList 已经被构造并且拥有两个初始项。
        
        // 访问和修改数组
        print("The shopping list contains \(shoppingList.count) items.")
        // 输出“The shopping list contains 2 items.”（这个数组有2个项）
        if shoppingList.isEmpty {
            print("The shopping list is empty.")
        } else {
            print("The shopping list is not empty.")
        }
        // 打印“The shopping list is not empty.”（shoppinglist 不是空的）
        shoppingList.append("Flour")
        // shoppingList 现在有3个数据项，似乎有人在摊煎饼
        shoppingList += ["Baking Powder"]
        // shoppingList 现在有四项了
        shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
        // shoppingList 现在有七项了
        _ = shoppingList[0]
        // 第一项是“Eggs”
        shoppingList[0] = "Six eggs"
        // 其中的第一项现在是“Six eggs”而不是“Eggs”
        
        /* 还可以利用下标来一次改变一系列数据值，即使新数据和原有数据的数量是不一样的。
        下面的例子把 "Chocolate Spread"、"Cheese" 和 "Butter" 替换为 "Bananas" 和 "Apples"：*/
        shoppingList[4...6] = ["Bananas", "Apples"]
        // shoppingList 现在有6项
        
        shoppingList.insert("Maple Syrup", at: 0)
        // shoppingList 现在有7项
        // 现在是这个列表中的第一项是“Maple Syrup”
        
        _ = shoppingList.remove(at: 0)
        // 索引值为0的数据项被移除
        // shoppingList 现在只有6项，而且不包括 Maple Syrup
        // mapleSyrup 常量的值等于被移除数据项“Maple Syrup”
        _ = shoppingList.removeLast()
        // 数组的最后一项被移除了
        // shoppingList 现在只有5项，不包括 Apples
        // apples 常量的值现在等于字符串“Apples”
    }
    
    // MARK: 1.2 =========================== 数组的遍历
    func point1() {
        print("=========================== 数组的遍历")
        let shoppingList = ["Six eggs", "Milk", "Flour", "Baking Powder", "Bananas"]
        for item in shoppingList {
            print(item)
        }
        // Six eggs
        // Milk
        // Flour
        // Baking Powder
        // Bananas
        
        for (index, value) in shoppingList.enumerated() {
            print("Item \(String(index + 1)): \(value)")
        }
        // Item 1: Six eggs
        // Item 2: Milk
        // Item 3: Flour
        // Item 4: Baking Powder
        // Item 5: Bananas
    }
}
