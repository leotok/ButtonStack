//
//  ViewController.swift
//  ButtonStack
//
//  Created by Leonardo Edelman Wajnsztok on 14/07/15.
//  Copyright (c) 2015 Leonardo Edelman Wajnsztok. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ButtonStackViewControllerDelegate {

    var plusButton: UIButton!
    var roundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plusButton = UIButton(frame: CGRectMake(0, 0, 40, 40))
        plusButton.center = CGPointMake(self.view.frame.width / 1.12 , self.view.frame.height / 1.06 )
        plusButton.setImage( UIImage(named: "plusButton"), forState: UIControlState.Normal)
        plusButton.addTarget(self, action: Selector("plusPressed:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        roundView = UIView()
        roundView.backgroundColor = UIColor(red:0.8353, green:0.2353, blue:0.2941, alpha:1)
        roundView.frame.size = CGSizeMake(50, 50)
        roundView.center = plusButton.center
        roundView.clipsToBounds = true
        roundView.layer.cornerRadius = 25
        
        self.view.addSubview(roundView)
        self.view.addSubview(plusButton)
    }

    func plusPressed(button: UIButton) {
        
        var stack = ButtonStackViewController(mainButton: button, numberOfButtons: 4)
        stack.delegate = self
        self.roundView.backgroundColor = UIColor(red:0, green:0, blue:0, alpha:0.5)
        self.presentViewController(stack, animated: false, completion: nil)
    }
    
    func buttonStack(buttonStack: ButtonStackViewController, didSelect button: UIButton, atIndexPath indexPath: NSIndexPath) {
        println("\(indexPath.row)")
        
    }
    
    func buttonStackDidCancel(buttonStack: ButtonStackViewController) {
        println("cancel")
        self.roundView.backgroundColor = UIColor(red:0.8353, green:0.2353, blue:0.2941, alpha:1)
    }

}

