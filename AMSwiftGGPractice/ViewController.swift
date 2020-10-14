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
        AMBasicsPart1().SetupTest()
        AMBasicsPart2().SetupTest()
        AMBasicsPart3().SetupTest()
        AMBasicsPart4().SetupTest()
        
        AMBasicsOperatorPart1().SetupTest()
        AMBasicsOperatorPart2().SetupTest()
        
        AMClassAndStructPart1().SetupTest()
        
        AMPropertyPart1().SetupTest()
        AMPropertyPart2().SetupTest()
        
        AMFunctionPart1().SetupTest()
        AMFunctionPart2().SetupTest()
        
        AMBlocksPart1().SetupTest()
        AMBlocksPart2().SetupTest()
    }
}

