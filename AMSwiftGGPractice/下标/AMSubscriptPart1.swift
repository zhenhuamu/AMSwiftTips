//
//  AMSubscriptPart1.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/23.
//

import Foundation

class AMSubscriptPart1 {
    /* 下标允许你通过在实例名称后面的方括号中传入一个或者多个索引值来对实例进行查询。
    它的语法类似于实例方法语法和计算型属性语法。
    定义下标使用 subscript 关键字，与定义实例方法类似，都是指定一个或多个输入参数和一个返回类型。
    与实例方法不同的是，下标可以设定为读写或只读。这种行为由 getter 和 setter 实现，类似计算型属性：*/
    func SetupTest() {
        Test()
        Test1()
        Test2()
        Test4()
    }
    ///-----------------------------下标语法-----------------------------///
    func Test() {
        struct TimesTable {
            let multiplier: Int
            subscript(index: Int) -> Int {
                return multiplier * index
            }
        }
        let threeTimesTable = TimesTable(multiplier: 3)
        print("six times three is \(threeTimesTable[6])")
        // 打印“six times three is 18”
        /* 注意
        TimesTable 例子基于一个固定的数学公式，对 threeTimesTable[someIndex] 进行赋值操作并不合适，因此下标定义为只读的。*/
    }
    ///-----------------------------下标用法-----------------------------///
    /* “下标”的确切含义取决于使用场景。下标通常作为访问集合，列表或序列中元素的快捷方式。
    你可以针对自己特定的类或结构体功能来以最恰当的方式实现下标。*/
    func Test1() {
        /*例如，Swift 的 Dictionary 类型实现下标用于对实例中储存的值进行存取操作。
        为字典设值时，在下标中使用和字典的键类型相同的键，并把一个和字典的值类型相同的值赋给这个下标：*/
        var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
        numberOfLegs["bird"] = 2
    }
    
    ///-----------------------------下标选项-----------------------------///
    // 下标可以接受任意数量的入参，并且这些入参可以是任何类型。下标的返回值也可以是任意类型。
    func Test2() {
        struct Matrix {
            let rows: Int, columns: Int
            var grid: [Double]
            init(rows: Int, columns: Int) {
                self.rows = rows
                self.columns = columns
                grid = Array(repeating: 0.0, count: rows * columns)
            }
            func indexIsValid(row: Int, column: Int) -> Bool {
                return row >= 0 && row < rows && column >= 0 && column < columns
            }
            subscript(row: Int, column: Int) -> Double {
                get {
                    assert(indexIsValid(row: row, column: column), "Index out of range")
                    return grid[(row * columns) + column]
                }
                set {
                    assert(indexIsValid(row: row, column: column), "Index out of range")
                    grid[(row * columns) + column] = newValue
                }
            }
        }
    }
    
    ///-----------------------------类型下标-----------------------------///
    /* 正如上节所述，实例下标是在特定类型的一个实例上调用的下标。
    你也可以定义一种在这个类型自身上调用的下标。这种下标被称作类型下标。
    你可以通过在 subscript 关键字之前写下 static 关键字的方式来表示一个类型下标。
    类类型可以使用 class 关键字来代替 static，它允许子类重写父类中对那个下标的实现。
    下面的例子展示了如何定义和调用一个类型下标：*/
    func Test4() {
        enum Planet: Int {
            case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
            static subscript(n: Int) -> Planet {
                return Planet(rawValue: n)!
            }
        }
        let mars = Planet[4]
        print(mars)
    }

}
