//
//  ViewController.swift
//  lottie-ios
//
//  Created by Alexis Araujo on 2/20/17.
//  Copyright © 2017 alexisaraujo. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    var menuOn = false
    var hamburguerMenuButton:LOTAnimationView?
    let hamburguerMenuFrame = CGRect(x:0, y:10, width: 75, height: 75)

    override func viewDidLoad() {
        super.viewDidLoad()
       
        addHamburguerMenuButton(on: menuOn)
    }
    
    func addHamburguerMenuButton (on:Bool){
        if hamburguerMenuButton != nil {
            hamburguerMenuButton?.removeFromSuperview()
            hamburguerMenuButton = nil
        }
        
        let animation = on ? "buttonOff" : "buttonOn"
        
        hamburguerMenuButton = LOTAnimationView.animationNamed(animation)
        hamburguerMenuButton?.isUserInteractionEnabled = true
        hamburguerMenuButton?.frame = hamburguerMenuFrame
        hamburguerMenuButton?.contentMode = .scaleAspectFill
        
        addmenuToggleRecognizer()
        
        self.view.addSubview(hamburguerMenuButton!)
    }
    
    func addmenuToggleRecognizer () {
        let tapRecognizer = UITapGestureRecognizer(target: self, action:
            #selector(ViewController.toggleMenu(recognizer:)))
        
        tapRecognizer.numberOfTapsRequired = 1
        
        hamburguerMenuButton?.addGestureRecognizer(tapRecognizer)
    }
    
    func toggleMenu (recognizer:UITapGestureRecognizer) {
        if !menuOn {
            hamburguerMenuButton?.play(completion: { (sucess: Bool) in
                self.menuOn = true
                self.addHamburguerMenuButton(on: self.menuOn)
            })
        } else {
            hamburguerMenuButton?.play(completion: { (sucess: Bool) in
                self.menuOn = false
                self.addHamburguerMenuButton(on: self.menuOn)
            })
        }
    }

    @IBAction func showAnimation(_ sender: UIButton) {
        let animationView = LOTAnimationView.animationNamed("PinJump")
        animationView?.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: 250)
        animationView?.contentMode = .scaleAspectFill
        animationView?.loopAnimation = true
        self.view.addSubview(animationView!)
        
        animationView?.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

