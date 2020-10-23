//
//  AMInitPart2.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/23.
//

import Foundation

class AMInitPart2 {
    
    func SetupTest() {
        Test()
        Test1()
        Test2()
    }
    
    ///-----------------------------默认构造器-----------------------------///
    /* 如果结构体或类为所有属性提供了默认值，又没有提供任何自定义的构造器，
    那么 Swift 会给这些结构体或类提供一个默认构造器。
    这个默认构造器将简单地创建一个所有属性值都设置为它们默认值的实例。*/
    func Test() {
        class ShoppingListItem {
            var name: String?
            var quantity = 1
            var purchased = false
        }
        _ = ShoppingListItem()
        
        // 结构体的逐一成员构造器
        /* 结构体如果没有定义任何自定义构造器，它们将自动获得一个逐一成员构造器（memberwise initializer）。
        不像默认构造器，即使存储型属性没有默认值，结构体也能会获得逐一成员构造器。
        逐一成员构造器是用来初始化结构体新实例里成员属性的快捷方法。
        新实例的属性初始值可以通过名字传入逐一成员构造器中。*/
        struct Size {
            var width = 0.0, height = 0.0
        }
        _ = Size(width: 2.0, height: 2.0)
        
        let zeroByTwo = Size(height: 2.0)
        print(zeroByTwo.width, zeroByTwo.height)
        // 打印 "0.0 2.0"

        let zeroByZero = Size()
        print(zeroByZero.width, zeroByZero.height)
        // 打印 "0.0 0.0"
    }
    
    ///-----------------------------值类型的构造器代理-----------------------------///
    
    
    ///-----------------------------类的继承和构造过程-----------------------------///
    /* 类里面的所有存储型属性——包括所有继承自父类的属性——都必须在构造过程中设置初始值。
     Swift 为类类型提供了两种构造器来确保实例中所有存储型属性都能获得初始值，
     它们被称为指定构造器和便利构造器。*/
    func Test1() {
        // 指定构造器和便利构造
        /*
        指定构造器是类中最主要的构造器。一个指定构造器将初始化类中提供的所有属性，并调用合适的父类构造器让构造过程沿着父类链继续往上进行。
        类倾向于拥有极少的指定构造器，普遍的是一个类只拥有一个指定构造器。指定构造器像一个个“漏斗”放在构造过程发生的地方，让构造过程沿着父类链继续往上进行。
        每一个类都必须至少拥有一个指定构造器。在某些情况下，许多类通过继承了父类中的指定构造器而满足了这个条件。具体内容请参考后续章节 构造器的自动继承。
        便利构造器是类中比较次要的、辅助型的构造器。你可以定义便利构造器来调用同一个类中的指定构造器，并为部分形参提供默认值。你也可以定义便利构造器来创建一个特殊用途或特定输入值的实例。
        你应当只在必要的时候为类提供便利构造器，比方说某种情况下通过使用便利构造器来快捷调用某个指定构造器，能够节省更多开发时间并让类的构造过程更清晰明了。*/
        struct Demo {
            var a:String
            // 类的指定构造器的写法跟值类型简单构造器一样：
            init(a: String) {
                self.a = a
            }
            
            // 便利构造器也采用相同样式的写法，但需要在 init 关键字之前放置 convenience 关键字，并使用空格将它们俩分开：
//            convenience init(a: String) {
//                self.a = a
//            }
        }
        
        // 类类型的构造器代理
        /* 为了简化指定构造器和便利构造器之间的调用关系，Swift 构造器之间的代理调用遵循以下三条规则：
        规则 1 指定构造器必须调用其直接父类的的指定构造器。
        规则 2 便利构造器必须调用同类中定义的其它构造器。
        规则 3 便利构造器最后必须调用指定构造器。
        一个更方便记忆的方法是：
        指定构造器必须总是向上代理
        便利构造器必须总是横向代理 */
        
        
        // 两段式构造过程
        /* Swift 中类的构造过程包含两个阶段。
        第一个阶段，类中的每个存储型属性赋一个初始值。当每个存储型属性的初始值被赋值后，
        第二阶段开始，它给每个类一次机会，在新实例准备使用之前进一步自定义它们的存储型属性。
        两段式构造过程的使用让构造过程更安全，同时在整个类层级结构中给予了每个类完全的灵活性。
        两段式构造过程可以防止属性值在初始化之前被访问，也可以防止属性被另外一个构造器意外地赋予不同的值。
        */
        
        // 构造器的继承和重写
        /* 跟 Objective-C 中的子类不同，Swift 中的子类默认情况下不会继承父类的构造器。
        Swift 的这种机制可以防止一个父类的简单构造器被一个更精细的子类继承，
        而在用来创建子类时的新实例时没有完全或错误被初始化。*/
        
        // 会自动获得一个默认构造器
        class Vehicle {
            var numberOfWheels = 0
            var description: String {
                return "\(numberOfWheels) wheel(s)"
            }
        }
        let vehicle = Vehicle()
        print("Vehicle: \(vehicle.description)")
        // Vehicle: 0 wheel(s)
        
        //--------------继承----------------
        class Bicycle: Vehicle {
            override init() {
                super.init()
                numberOfWheels = 2
            }
        }
        let bicycle = Bicycle()
        print("Bicycle: \(bicycle.description)")
        // 打印“Bicycle: 2 wheel(s)”
        
        //---------------重写---------------
        class Hoverboard: Vehicle {
            var color: String
            init(color: String) {
                self.color = color
                // super.init() 在这里被隐式调用
            }
            override var description: String {
                return "\(super.description) in a beautiful \(color)"
            }
        }
        /* 注意
         子类可以在构造过程修改继承来的变量属性，但是不能修改继承来的常量属性。*/
        
        // 构造器的自动继承
        /* 如上所述，子类在默认情况下不会继承父类的构造器。
        但是如果满足特定条件，父类构造器是可以被自动继承的。
        事实上，这意味着对于许多常见场景你不必重写父类的构造器，并且可以在安全的情况下以最小的代价继承父类的构造器。
        假设你为子类中引入的所有新属性都提供了默认值，以下 2 个规则将适用：
        规则 1 如果子类没有定义任何指定构造器，它将自动继承父类所有的指定构造器。
        规则 2
            如果子类提供了所有父类指定构造器的实现——无论是通过规则 1 继承过来的，还是提供了自定义实现——它将自动继承父类所有的便利构造器。
        即使你在子类中添加了更多的便利构造器，这两条规则仍然适用。
        注意
        子类可以将父类的指定构造器实现为便利构造器来满足规则 2。*/
        
    }
    
    ///-----------------------------指定构造器和便利构造器实践-----------------------------///
    func Test2() {
        class Food {
            var name: String
            init(name: String) {
                self.name = name
            }

            convenience init() {
                self.init(name: "[Unnamed]")
            }
        }
        // 指定构造器
        _ = Food(name: "Bacon")
        // namedMeat 的名字是 "Bacon"
        
        // 便利构造器
        _ = Food()
        // mysteryMeat 的名字是 [Unnamed]
        
        class RecipeIngredient: Food {
            var quantity: Int
            init(name: String, quantity: Int) {
                self.quantity = quantity
                super.init(name: name)
            }
            override convenience init(name: String) {
                self.init(name: name, quantity: 1)
            }
        }
        
        /* 在这个例子中，RecipeIngredient 的父类是 Food，它有一个便利构造器 init()。
        这个便利构造器会被 RecipeIngredient 继承。这个继承版本的 init() 在功能上跟 Food 提供的版本是一样的，
        只是它会代理到 RecipeIngredient 版本的 init(name: String) 而不是 Food 提供的版本。*/
        
        // 便利构造器
        _ = RecipeIngredient()
        // 便利构造器
        _ = RecipeIngredient(name: "Bacon")
        // 指定构造器
        _ = RecipeIngredient(name: "Eggs", quantity: 6)
        
        class ShoppingListItem: RecipeIngredient {
            var purchased = false
            var description: String {
                var output = "\(quantity) x \(name)"
                output += purchased ? " ✔" : " ✘"
                return output
            }
        }
        
        let breakfastList = [
            ShoppingListItem(),
            ShoppingListItem(name: "Bacon"),
            ShoppingListItem(name: "Eggs", quantity: 6),
        ]
        breakfastList[0].purchased = true
        for item in breakfastList {
            print(item.description)
        }
        // 1 x [Unnamed] ✔
        // 1 x bacon ✘
        // 6 x eggs ✘
        
    }

}
