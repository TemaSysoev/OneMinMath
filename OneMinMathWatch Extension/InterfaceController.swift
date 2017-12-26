//
//  InterfaceController.swift
//  OneMinMathWatch Extension
//
//  Created by Tema Sysoev on 26.12.2017.
//  Copyright © 2017 Tema Sysoev. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    var timer = Timer()
    var end = 60
    var karma = 0
    @IBOutlet var moreThan: WKInterfaceLabel!
    var a1 = Int(arc4random_uniform(500))
    var b1 = Int(arc4random_uniform(500))
    var a2 = Int(arc4random_uniform(500))
    var b2 = Int(arc4random_uniform(500))
    @IBOutlet var Var1: WKInterfaceLabel!
    @IBOutlet var True: WKInterfaceButton!
    @IBOutlet var Var2: WKInterfaceLabel!
    @IBOutlet var False: WKInterfaceButton!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
       
        Var1.setText("\(a1) - \(b1)")
        Var2.setText("\(a2) - \(b2)")
        
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    @objc func update(){
        end = end - 1
        print(end)
        if end <= 0{
            timer.invalidate()
            Var2.setHidden(true)
            moreThan.setHidden(true)
            Var1.setText("Score:\(karma)")
            False.setHidden(true)
            True.setHidden(true)
           
        }
    }
    func updateText(){
        Var1.setText("\(a1) - \(b1)")
        Var2.setText("\(a2) - \(b2)")
    }
    func updateData(){
        a1 = Int(arc4random_uniform(500))
        b1 = Int(arc4random_uniform(500))
        a2 = Int(arc4random_uniform(500))
        b2 = Int(arc4random_uniform(500))
    }
    @IBAction func TrueAction() {
        if a1-b1 > a2-b2{
            karma = karma + 1
            print(karma)
            
        }else{
            karma = karma - 1
            print(karma)
        }
        updateData()
        updateText()
    }
    @IBAction func FalseAction() {
        if a1-b1 > a2-b2{
            karma = karma - 1
            print(karma)
        }else{
            karma = karma + 1
            print(karma)
        }
        updateData()
        updateText()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
