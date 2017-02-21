//
//  ViewController.swift
//  lottie-ios
//
//  Created by Alexis Araujo on 2/20/17.
//  Copyright © 2017 alexisaraujo. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var scrollView: UIScrollView!
    
    let animationView = LOTAnimationView.animationNamed("tutorial")
    let stringArray = ["<-- Swipe to begin", "Welcome to bed", "Dont Forget to clean", "With Water", "Then eat toast", "And go to work"]

    override func viewDidLoad() {
        super.viewDidLoad()
       
        animationView?.frame = CGRect(x:0, y: 50, width: self.view.frame.size.width, height: 300)
        animationView?.contentMode = .scaleAspectFill
        
        animationView?.loopAnimation = true
        
        self.view.addSubview(animationView!)
        
        setupScrollView()
        
        //animationView?.play()
        
       // let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(recognizer:)))
        
        //self.view.addGestureRecognizer(panGestureRecognizer)

    }
    
    func handlePan (recognizer:UIPanGestureRecognizer) {
            let translation = recognizer.translation(in: self.view)
            let progress = translation.x / self.view.bounds.size.width
        
            animationView?.animationProgress = progress
        }
    
    func setupScrollView () {
        scrollView.delegate = self
            scrollView.contentSize = CGSize(width: self.view.frame.size.width * 6, height: scrollView.frame.size.height)
        
        for i in 0 ... 5 {
            let label = UILabel(frame: CGRect(x: scrollView.center.x + CGFloat(i) * self.view.frame.size.width - 130, y: 50, width: 260, height: 30))
            label.font = UIFont.boldSystemFont(ofSize: 26)
            label.textAlignment = .center
            label.text = stringArray[i]
            
            scrollView.addSubview(label)
            
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let progress = scrollView.contentOffset.x / scrollView.contentSize.width
        animationView?.animationProgress = progress
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

