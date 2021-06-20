//
//  AMInitPart1.swift
//  AMSwiftGGPractice
//
//  Created by AndyMu on 2020/10/23.
//

import Foundation

class AMInitPart1 {

    func SetupTest() {
        Test()
        Test1()
    }
    
    // MARK: 1.1 =========================== 存储属性的初始赋值
    /* 类和结构体在创建实例时，必须为所有存储型属性设置合适的初始值。
     存储型属性的值不能处于一个未知的状态。*/
    /*注意
    当你为存储型属性分配默认值或者在构造器中设置初始值时，
    它们的值是被直接设置的，不会触发任何属性观察者。*/
    func Test() {
        // 构造器
        /* 构造器在创建某个特定类型的新实例时被调用。
         它的最简形式类似于一个不带任何形参的实例方法，以关键字 init 命名：*/
        struct Fahrenheit {
            var temperature: Double
            init() {
                temperature = 32.0
            }
        }
        let f = Fahrenheit()
        print("The default temperature is \(f.temperature)° Fahrenheit")
        // 打印“The default temperature is 32.0° Fahrenheit”
        
        // 默认属性值
        // 如前所述，你可以在构造器中为存储型属性设置初始值。同样，你也可以在属性声明时为其设置默认值。
        struct Fahrenheit1 {
            var temperature = 32.0
        }
    }
    
    // MARK: 1.2 =========================== 自定义构造过程
    func Test1() {
        // 形参的构造过程
        /* 自定义构造过程时，可以在定义中提供构造形参，指定其值的类型和名字。
        构造形参的功能和语法跟函数和方法的形参相同。*/
        struct Celsius {
            var temperatureInCelsius: Double
            init(fromFahrenheit fahrenheit: Double) {
                temperatureInCelsius = (fahrenheit - 32.0) / 1.8
            }
            init(fromKelvin kelvin: Double) {
                temperatureInCelsius = kelvin - 273.15
            }
        }

        _ = Celsius(fromFahrenheit: 212.0)
        // boilingPointOfWater.temperatureInCelsius 是 100.0
        _ = Celsius(fromKelvin: 273.15)
        // freezingPointOfWater.temperatureInCelsius 是 0.0
        
        // 形参命名和实参标签
        /* 跟函数和方法形参相同，
        构造形参可以同时使用在构造器里使用的形参命名和一个外部调用构造器时使用的实参标签。
        然而，构造器并不像函数和方法那样在括号前有一个可辨别的方法名。
        因此在调用构造器时，主要通过构造器中形参命名和类型来确定应该被调用的构造器。
        正因如此，如果你在定义构造器时没有提供实参标签，Swift 会为构造器的每个形参自动生成一个实参标签。*/
        struct Color {
            let red, green, blue: Double
            init(red: Double, green: Double, blue: Double) {
                self.red   = red
                self.green = green
                self.blue  = blue
            }
            init(white: Double) {
                red   = white
                green = white
                blue  = white
            }
        }
        _ = Color(red: 1.0, green: 0.0, blue: 1.0)
        _ = Color(white: 0.5)
        
        // 不带实参标签的构造器形参
        /* 如果你不希望构造器的某个形参使用实参标签，
        可以使用下划线（_）来代替显式的实参标签来重写默认行为。*/
        struct Celsius1 {
            var temperatureInCelsius: Double
            init(fromFahrenheit fahrenheit: Double) {
                temperatureInCelsius = (fahrenheit - 32.0) / 1.8
            }
            init(fromKelvin kelvin: Double) {
                temperatureInCelsius = kelvin - 273.15
            }
            init(_ celsius: Double){
                temperatureInCelsius = celsius
            }
        }

        _ = Celsius1(37.0)
        // bodyTemperature.temperatureInCelsius 为 37.0
        
        // 可选属性类型
        /* 如果你自定义的类型有一个逻辑上允许值为空的存储型属性——无论是因为它无法在初始化时赋值，
        还是因为它在之后某个时机可以赋值为空——都需要将它声明为 可选类型。
        可选类型的属性将自动初始化为 nil，表示这个属性是特意在构造过程设置为空。*/
        class SurveyQuestion {
            var text: String
            var response: String?
            init(text: String) {
                self.text = text
            }
            func ask() {
                print(text)
            }
        }

        let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
        cheeseQuestion.ask()
        // 打印“Do you like cheese?”
        cheeseQuestion.response = "Yes, I do like cheese."
        
        // 构造过程中常量属性的赋值
        /* 你可以在构造过程中的任意时间点给常量属性赋值，只要在构造过程结束时它设置成确定的值。
        一旦常量属性被赋值，它将永远不可更改。*/
        class SurveyQuestion1 {
            let text: String
            init(text: String) {
                self.text = text
            }
            func ask() {
                print(text)
            }
        }
        let beetsQuestion = SurveyQuestion1(text: "How about beets?")
        beetsQuestion.ask()
    }
}
