//
//  AMSetPart2.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/15.
//

import Foundation

class AMSetPart2 {
    func SetupTest() {
        Test()
        Test1()
    }
    
    // MARK: 1.1 =========================== 集合
    func Test() {
        // 创建和构造一个空的集合
        var letters = Set<Character>()
        print("letters is of type Set<Character> with \(letters.count) items.")
        // 打印“letters is of type Set<Character> with 0 items.”
       
        letters.insert("a")
        // letters 现在含有1个 Character 类型的值
        letters = []
        // letters 现在是一个空的 Set，但是它依然是 Set<Character> 类型
        
        // 用数组字面量创建集合
        var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
        // favoriteGenres 被构造成含有三个初始值的集合
        
        // 一个集合类型不能从数组字面量中被直接推断出来，因此 Set 类型必须显式声明。
        var _: Set = ["Rock", "Classical", "Hip hop"]
        
        // 访问和修改一个集合
        print("I have \(favoriteGenres.count) favorite music genres.")
        // 打印“I have 3 favorite music genres.”
        
        if favoriteGenres.isEmpty {
            print("As far as music goes, I'm not picky.")
        } else {
            print("I have particular music preferences.")
        }
        // 打印“I have particular music preferences.”
        
        favoriteGenres.insert("Jazz")
        // favoriteGenres 现在包含4个元素
        
        if let removedGenre = favoriteGenres.remove("Rock") {
            print("\(removedGenre)? I'm over it.")
        } else {
            print("I never much cared for that.")
        }
        // 打印“Rock? I'm over it.”
        
        if favoriteGenres.contains("Funk") {
            print("I get up on the good foot.")
        } else {
            print("It's too funky in here.")
        }
        // 打印“It's too funky in here.”
        
        for genre in favoriteGenres {
            print("\(genre)")
        }
        // Classical
        // Jazz
        // Hip hop
        
        for genre in favoriteGenres.sorted() {
            print("\(genre)")
        }
        // Classical
        // Hip hop
        // Jazz
    }
    
    // MARK: 1.2 =========================== 基本集合操作
    
    func Test1() {
        //使用 intersection(_:) 方法根据两个集合的交集创建一个新的集合。
        //使用 symmetricDifference(_:) 方法根据两个集合不相交的值创建一个新的集合。
        //使用 union(_:) 方法根据两个集合的所有值创建一个新的集合。
        //使用 subtracting(_:) 方法根据不在另一个集合中的值创建一个新的集合。
        
        let oddDigits: Set = [1, 3, 5, 7, 9]
        let evenDigits: Set = [0, 2, 4, 6, 8]
        let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

        let a = oddDigits.union(evenDigits).sorted()
        print(a)
        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        let b = oddDigits.intersection(evenDigits).sorted()
        print(b)
        // []
        let c = oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
        print(c)
        // [1, 9]
        let d = oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
        print(d)
        // [1, 2, 9]
        
        
        //使用“是否相等”运算符（==）来判断两个集合包含的值是否全部相同。
        //使用 isSubset(of:) 方法来判断一个集合中的所有值是否也被包含在另外一个集合中。
        //使用 isSuperset(of:) 方法来判断一个集合是否包含另一个集合中所有的值。
        //使用 isStrictSubset(of:) 或者 isStrictSuperset(of:) 方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
        //使用 isDisjoint(with:) 方法来判断两个集合是否不含有相同的值（是否没有交集）。
        
        let houseAnimals: Set = ["🐶", "🐱"]
        let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
        let cityAnimals: Set = ["🐦", "🐭"]

        let _ = houseAnimals.isSubset(of: farmAnimals)
        // true
        let _ = farmAnimals.isSuperset(of: houseAnimals)
        // true
        let _ = farmAnimals.isDisjoint(with: cityAnimals)
        // true
    }
}
