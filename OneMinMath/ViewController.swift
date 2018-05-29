//
//  ViewController.swift
//  OneMinMath
//
//  Created by Tema Sysoev on 24.12.2017.
//  Copyright © 2017 Tema Sysoev. All rights reserved.
//

import UIKit
import Social
import AudioToolbox

class ViewController: UIViewController {
    @IBOutlet weak var Var1: UILabel!
    @IBOutlet weak var Var2: UILabel!
    @IBOutlet weak var Karma: UILabel!
    @IBOutlet weak var Share: UIButton!
    @IBOutlet weak var True: UIButton!
    @IBOutlet weak var False: UIButton!
    @IBOutlet weak var Vopros: UILabel!
    var timer = Timer()
    var end = 8
    var karma = 0
    var a1 = Int(arc4random_uniform(500))
    var b1 = Int(arc4random_uniform(500))
    var a2 = Int(arc4random_uniform(500))
    var b2 = Int(arc4random_uniform(500))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Share.isHidden = true
        Var1.text = ("\(a1) - \(b1)")
        Var2.text = ("\(a2) - \(b2)")
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        Var2.isHidden = true
        Var1.isHidden = true
        Vopros.text = ""
        Karma.text = ""
        
    }
    @objc func update(){
        end = end - 1
        print(end)
        
        if end >= 7{
            
            Var2.isHidden = true
            Var1.isHidden = false
            Vopros.text = ""
            Karma.text = ""
        }
        if end == 6{
            Var2.isHidden = true
            Var1.isHidden = true
            Vopros.text = ""
            Karma.text = ">"
        }
        if end == 5{
            Var2.isHidden = false
            Var1.isHidden = true
            Vopros.text = ""
            Karma.text = ""
        }
        if end == 4{
            Var2.isHidden = true
            Var1.isHidden = true
            Vopros.text = "?"
            Karma.text = ""
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
        if end == 3 {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
        if end == 2 {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
           
        }
        if end == 1 {
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
        }
        if end <= 0{
            timer.invalidate()
            Var2.isHidden = true
            Var1.isHidden = true
            Karma.text = "\(karma)"
            False.isHidden = true
            True.isHidden = true
            Share.isHidden = false
            Vopros.isHidden = true
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
        end = 8
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
        end = 8
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

