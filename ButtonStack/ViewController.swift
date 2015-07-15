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
    var roundView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plusButton = UIButton(frame: CGRectMake(0, 0, 40, 40))
        plusButton.center = CGPointMake(self.view.frame.width / 1.12 , self.view.frame.height / 1.06 )
        plusButton.setImage( UIImage(named: "plusButton"), forState: UIControlState.Normal)
        plusButton.addTarget(self, action: Selector("plusPressed:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        var blur = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        roundView = UIVisualEffectView(effect: blur)
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
        self.presentViewController(stack, animated: false, completion: nil)
    }
    
    func buttonStack(buttonStack: ButtonStackViewController, didSelect button: UIButton, atIndexPath indexPath: NSIndexPath) {
        println("\(indexPath.row)")
        
    }

}

