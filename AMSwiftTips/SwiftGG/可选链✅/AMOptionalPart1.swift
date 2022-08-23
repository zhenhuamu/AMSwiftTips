//
//  AMOptionalPart1.swift
//  AMSwiftTips
//
//  Created by AndyMu on 2020/10/23.
//

import Foundation

class AMOptionalPart1 {
    
    func setup() {
        point()
        point1()
        point2()
    }
    
    // MARK: 1.1 =========================== 使用可选链式调用代替强制解包
    /* 通过在想调用的属性、方法，或下标的可选值后面放一个问号（?），可以定义一个可选链。
    这一点很像在可选值后面放一个叹号（!）来强制解包它的值。
    它们的主要区别在于当可选值为空时可选链式调用只会调用失败，然而强制解包将会触发运行时错误。*/
    func point() {
        print("=========================== 使用可选链式调用代替强制解包")
        class Person {
            var residence: Residence?
        }

        class Residence {
            var numberOfRooms = 1
        }
        
        let john = Person()
//        let roomCount = john.residence!.numberOfRooms
        // 这会引发运行时错误
        
        if let roomCount = john.residence?.numberOfRooms {
            print("John's residence has \(roomCount) room(s).")
        } else {
            print("Unable to retrieve the number of rooms.")
        }
        // 打印“Unable to retrieve the number of rooms.”
        
    }
    
    // MARK: 1.2 =========================== 为可选链式调用定义模型类
    /* 通过使用可选链式调用可以调用多层属性、方法和下标。
    这样可以在复杂的模型中向下访问各种子属性，并且判断能否访问子属性的属性、方法和下标。*/
    func point1() {
        print("=========================== 为可选链式调用定义模型类")
        class Person {
            var residence: Residence?
        }
        class Residence {
            var rooms = [Room]()
            var numberOfRooms: Int {
                return rooms.count
            }
            subscript(i: Int) -> Room {
                get {
                    return rooms[i]
                }
                set {
                    rooms[i] = newValue
                }
            }
            func printNumberOfRooms() {
                print("The number of rooms is \(numberOfRooms)")
            }
            var address: Address?
        }
        
        class Room {
            let name: String
            init(name: String) { self.name = name }
        }
        
        class Address {
            var buildingName: String?
            var buildingNumber: String?
            var street: String?
            func buildingIdentifier() -> String? {
                if buildingName != nil {
                    return buildingName
                } else if let buildingNumber = buildingNumber, let street = street {
                    return "\(buildingNumber) \(street)"
                } else {
                    return nil
                }
            }
        }
        
        // 通过可选链式调用访问属性
        let john = Person()
        if let roomCount = john.residence?.numberOfRooms {
            print("John's residence has \(roomCount) room(s).")
        } else {
            print("Unable to retrieve the number of rooms.")
        }
        // 打印“Unable to retrieve the number of rooms.”
        
        let someAddress = Address()
        someAddress.buildingNumber = "29"
        someAddress.street = "Acacia Road"
        john.residence?.address = someAddress
        // 在这个例子中，通过 john.residence 来设定 address 属性也会失败，因为 john.residence 当前为 nil。
        
        // 通过可选链式调用来调用方法
        if john.residence?.printNumberOfRooms() != nil {
            print("It was possible to print the number of rooms.")
        } else {
            print("It was not possible to print the number of rooms.")
        }
        // 打印“It was not possible to print the number of rooms.”
        
        // 通过可选链式调用访问下标
        if let firstRoomName = john.residence?[0].name {
            print("The first room name is \(firstRoomName).")
        } else {
            print("Unable to retrieve the first room name.")
        }
        // 打印“Unable to retrieve the first room name.”
        
        // MARK: 1.3 =========================== 连接多层可选链式调用
        print("=========================== 连接多层可选链式调用")
        /* 可以通过连接多个可选链式调用在更深的模型层级中访问属性、方法以及下标。
         然而，多层可选链式调用不会增加返回值的可选层级。
         也就是说：
         如果你访问的值不是可选的，可选链式调用将会返回可选值。
         如果你访问的值就是可选的，可选链式调用不会让可选返回值变得“更可选”。
         因此：
         通过可选链式调用访问一个 Int 值，将会返回 Int?，无论使用了多少层可选链式调用。
         类似的，通过可选链式调用访问 Int? 值，依旧会返回 Int? 值，并不会返回 Int??。*/
        if let johnsStreet = john.residence?.address?.street {
            print("John's street name is \(johnsStreet).")
        } else {
            print("Unable to retrieve the address.")
        }
        // 打印“Unable to retrieve the address.”
        
        // MARK: 1.4 =========================== 在方法的可选返回值上进行可选链式调用
        if let beginsWithThe =
            john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
                if beginsWithThe {
                    print("John's building identifier begins with \"The\".")
                } else {
                    print("John's building identifier does not begin with \"The\".")
                }
        }
        // 打印“John's building identifier begins with "The".”
        /* 注意
         在上面的例子中，在方法的圆括号后面加上问号是因为你要在 buildingIdentifier() 方法的可选返回值上进行可选链式调用，而不是 buildingIdentifier() 方法本身。*/
        
    }
    
    // MARK: 1.5 =========================== 访问可选类型的下标
    /* 如果下标返回可选类型值，比如 Swift 中 Dictionary 类型的键的下标，可以在下标的结尾括号后面放一个问号来在其可选返回值上进行可选链式调用：*/
    func point2() {
        var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
        testScores["Dave"]?[0] = 91
        testScores["Bev"]?[0] += 1
        testScores["Brian"]?[0] = 72
        // "Dave" 数组现在是 [91, 82, 84]，"Bev" 数组现在是 [80, 94, 81]
    }

}
