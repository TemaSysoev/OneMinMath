//
//  ViewController.swift
//  OneMinMath
//
//  Created by Tema Sysoev on 24.12.2017.
//  Copyright © 2017 Tema Sysoev. All rights reserved.
//

import UIKit
import Social


class ViewController: UIViewController {
    @IBOutlet var TrueRight: UISwipeGestureRecognizer!
    @IBOutlet var FalseLeft: UISwipeGestureRecognizer!
    @IBOutlet var ShareUp: UISwipeGestureRecognizer!
    @IBOutlet weak var Var1: UILabel!
    @IBOutlet weak var Var2: UILabel!
    @IBOutlet weak var Karma: UILabel!
    var timer = Timer()
    var end = 10
    var karma = 0
    var a1 = Int(arc4random_uniform(500))
    var b1 = Int(arc4random_uniform(500))
    var a2 = Int(arc4random_uniform(500))
    var b2 = Int(arc4random_uniform(500))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ShareUp.isEnabled = false
        Var1.text = ("\(a1) - \(b1)")
        Var2.text = ("\(a2) - \(b2)")
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    @objc func update(){
        end = end - 1
        print(end)
        if end <= 0{
            timer.invalidate()
            TrueRight.isEnabled = false
            FalseLeft.isEnabled = false
            Var2.isHidden = true
            Var1.isHidden = true
            Karma.text = "Score:\(karma)"
            ShareUp.isEnabled = true
        }
    }
    func updateText(){
        Var1.text = ("\(a1) - \(b1)")
        Var2.text = ("\(a2) - \(b2)")
    }
    func updateData(){
        a1 = Int(arc4random_uniform(500))
        b1 = Int(arc4random_uniform(500))
        a2 = Int(arc4random_uniform(500))
        b2 = Int(arc4random_uniform(500))
    }
    @IBAction func True(_ sender: Any) {
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
    @IBAction func False(_ sender: Any) {
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
    @IBAction func Share(_ sender: Any) {
        let ShareText = "Hey, my score in OneMinMath \(karma)"
        let activityViewController = UIActivityViewController(
            activityItems: [ShareText as NSString],
            applicationActivities: nil)
        
        present(activityViewController, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

