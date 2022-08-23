//
//  AMDeinitPart3.swift
//  AMSwiftTips
//
//  Created by AndyMu on 2020/10/23.
//

import Foundation

class AMDeinitPart3 {

    func setup() {
        print("=========================== 析构过程")
        class Bank {
            static var coinsInBank = 10_000
            static func distribute(coins numberOfCoinsRequested: Int) -> Int {
                let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
                coinsInBank -= numberOfCoinsToVend
                return numberOfCoinsToVend
            }
            static func receive(coins: Int) {
                coinsInBank += coins
            }
        }
        
        class Player {
            var coinsInPurse: Int
            init(coins: Int) {
                coinsInPurse = Bank.distribute(coins: coins)
            }
            func win(coins: Int) {
                coinsInPurse += Bank.distribute(coins: coins)
            }
            deinit {
                Bank.receive(coins: coinsInPurse)
            }
        }
        
        var playerOne: Player? = Player(coins: 100)
        print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
        // 打印“A new player has joined the game with 100 coins”
        print("There are now \(Bank.coinsInBank) coins left in the bank")
        // 打印“There are now 9900 coins left in the bank”
       
        playerOne!.win(coins: 2_000)
        print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
        // 打印“PlayerOne won 2000 coins & now has 2100 coins”
        print("The bank now only has \(Bank.coinsInBank) coins left")
        // 打印“The bank now only has 7900 coins left”
        
        playerOne = nil
        print("PlayerOne has left the game")
        // 打印“PlayerOne has left the game”
        print("The bank now has \(Bank.coinsInBank) coins")
        // 打印“The bank now has 10000 coins”
        
    }
}
