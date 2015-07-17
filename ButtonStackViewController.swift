//
//  ButtonStackViewController.swift
//  ButtonStack
//
//  Created by Leonardo Edelman Wajnsztok on 14/07/15.
//  Copyright (c) 2015 Leonardo Edelman Wajnsztok. All rights reserved.
//

import UIKit

@objc protocol ButtonStackViewControllerDelegate: NSObjectProtocol {
    
    optional func buttonStack(buttonStack: ButtonStackViewController, didSelect button: UIButton, atIndexPath indexPath: NSIndexPath)
    
    optional func buttonStackDidCancel(buttonStack: ButtonStackViewController)
}

class ButtonStackViewController: UIViewController {
    
    var angle: CGFloat = 3.14 / 4
    var alpla: CGFloat = 1
    var spacing0: CGFloat = 70
    var spacing1: CGFloat = 60
    var spacing2: CGFloat = 120
    var spacing3: CGFloat = 180
    var spacing4: CGFloat = 240
    
    var numberOfButtons: Int = 1
    var prevButton: UIButton!
    var plusButton: UIButton!
    var delegate: ButtonStackViewControllerDelegate?
    
    var buttonButton: UIButton!
    var labelButton: UIButton!
    var textfieldButton: UIButton!
    var imageviewButton: UIButton!
    var doneButton: UIButton!
    
    init(mainButton: UIButton, numberOfButtons: Int) {
        super.init(nibName: nil, bundle: nil)
        
        self.prevButton = mainButton
        self.numberOfButtons = numberOfButtons
        
        prevButton.hidden = true
        plusButton = UIButton(frame: prevButton.frame)
        plusButton.setImage( prevButton.imageView?.image, forState: UIControlState.Normal)
        plusButton.addTarget(self, action: Selector("showButtons"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        self.view.addSubview(plusButton)
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        self.setAuxButtons()
        self.showButtons()
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        self.showButtons()
    }
    
    
    func setAuxButtons()
    {
        // botoes auxiliares
        
        var cornerRad: CGFloat = 10
        
        buttonButton = UIButton()
        buttonButton.frame.size = CGSizeMake(50, 50)
        buttonButton.center = CGPointMake(self.plusButton.center.x, self.plusButton.center.y - self.spacing0)
        buttonButton.alpha = 0
        buttonButton.backgroundColor = UIColor(red:1, green:0.8275, blue:0.498, alpha:1)
        buttonButton.setTitle("Button", forState: .Normal)
        buttonButton.setTitleColor(UIColor(red:0.1569, green:0.1686, blue:0.2078, alpha:1), forState: .Normal)
        buttonButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 11)
        buttonButton.clipsToBounds = true
        buttonButton.layer.cornerRadius = cornerRad
        buttonButton.addTarget(self, action: Selector("buttonAction:"), forControlEvents: UIControlEvents.TouchUpInside)
        buttonButton.tag = 4
        
        labelButton = UIButton()
        labelButton.frame.size = CGSizeMake(50, 50)
        labelButton.center = CGPointMake(self.plusButton.center.x, self.plusButton.center.y - self.spacing0)
        labelButton.alpha = 0
        labelButton.backgroundColor = UIColor(red:0.8353, green:0.9804, blue:0.502, alpha:1)
        labelButton.setTitle("Label", forState: .Normal)
        labelButton.setTitleColor(UIColor(red:0.1569, green:0.1686, blue:0.2078, alpha:1), forState: .Normal)
        labelButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 11)
        labelButton.clipsToBounds = true
        labelButton.layer.cornerRadius = cornerRad
        labelButton.addTarget(self, action: Selector("buttonAction:"), forControlEvents: UIControlEvents.TouchUpInside)
        labelButton.tag = 3
        
        textfieldButton = UIButton()
        textfieldButton.frame.size = CGSizeMake(50, 50)
        textfieldButton.center = CGPointMake(self.plusButton.center.x, self.plusButton.center.y - self.spacing0)
        textfieldButton.alpha = 0
        textfieldButton.backgroundColor = UIColor(red:0.4784, green:0.8392, blue:0.9922, alpha:1)
        textfieldButton.setTitle("TextField", forState: .Normal)
        textfieldButton.setTitleColor(UIColor(red:0.1569, green:0.1686, blue:0.2078, alpha:1), forState: .Normal)
        textfieldButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 11)
        textfieldButton.clipsToBounds = true
        textfieldButton.layer.cornerRadius = cornerRad
        textfieldButton.addTarget(self, action: Selector("buttonAction:"), forControlEvents: UIControlEvents.TouchUpInside)
        textfieldButton.tag = 2
        
        imageviewButton = UIButton()
        imageviewButton.frame.size = CGSizeMake(50, 50)
        imageviewButton.center = CGPointMake(self.plusButton.center.x, self.plusButton.center.y - self.spacing0)
        imageviewButton.alpha = 0
        imageviewButton.backgroundColor = UIColor(red:1, green:0.498, blue:0.4863, alpha:1)
        imageviewButton.setTitle("Image", forState: .Normal)
        imageviewButton.setTitleColor(UIColor(red:0.1569, green:0.1686, blue:0.2078, alpha:1), forState: .Normal)
        imageviewButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 11)
        imageviewButton.clipsToBounds = true
        imageviewButton.layer.cornerRadius = cornerRad
        imageviewButton.addTarget(self, action: Selector("buttonAction:"), forControlEvents: UIControlEvents.TouchUpInside)
        imageviewButton.tag = 1
        
        doneButton = UIButton()
        doneButton.frame.size = CGSizeMake(50, 50)
        doneButton.center = CGPointMake(self.plusButton.center.x, self.plusButton.center.y - self.spacing0)
        doneButton.alpha = 0
        doneButton.backgroundColor = UIColor(red:0.8392, green:0.5294, blue:0.9882, alpha:1)
        doneButton.setTitle("Done", forState: .Normal)
        doneButton.setTitleColor(UIColor(red:0.1569, green:0.1686, blue:0.2078, alpha:1), forState: .Normal)
        doneButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 11)
        doneButton.clipsToBounds = true
        doneButton.layer.cornerRadius = cornerRad
        doneButton.addTarget(self, action: Selector("buttonAction:"), forControlEvents: UIControlEvents.TouchUpInside)
        doneButton.tag = 0
        
        self.view.addSubview(buttonButton)
        self.view.addSubview(labelButton)
        self.view.addSubview(textfieldButton)
        self.view.addSubview(imageviewButton)
        self.view.addSubview(doneButton)
        
    }
    
    func showButtons() {
        
        UIView.animateWithDuration( 0.2 , animations: {
            
            //self.view.backgroundColor = UIColor(red: 1, green: 1 , blue: 1, alpha: 0)
            if self.alpla == 1
            {
                self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            }
            else {
                self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
                self.delegate?.buttonStackDidCancel!(self)
            }
            
            self.labelButton.center = CGPointMake(self.plusButton.center.x, self.labelButton.center.y - self.spacing1)
            self.textfieldButton.center = CGPointMake(self.plusButton.center.x, self.textfieldButton.center.y - self.spacing2)
            self.imageviewButton.center = CGPointMake(self.plusButton.center.x, self.imageviewButton.center.y - self.spacing3 )
            self.doneButton.center = CGPointMake(self.plusButton.center.x, self.doneButton.center.y - self.spacing4 )
            
            self.buttonButton.alpha = self.alpla
            self.labelButton.alpha = self.alpla
            self.textfieldButton.alpha = self.alpla
            self.imageviewButton.alpha = self.alpla
            self.doneButton.alpha = self.alpla
            
            self.plusButton.transform = CGAffineTransformRotate(self.plusButton.transform, self.angle)
            
            }, completion: { (value: Bool) in
                
                if self.alpla == -1
                {
                    self.prevButton.hidden = false
                    self.dismissViewControllerAnimated(false, completion: nil)
                }
                
                self.alpla = -self.alpla
                self.angle = -(self.angle)
                self.spacing1 = -(self.spacing1)
                self.spacing2 = -(self.spacing2)
                self.spacing3 = -(self.spacing3)
                self.spacing4 = -(self.spacing4)
                
            }
        )
    }
    
    func buttonAction(button: UIButton) {
        
        var indexPath = NSIndexPath(forRow: button.tag, inSection: 0)
        self.delegate?.buttonStack!(self, didSelect: button, atIndexPath: indexPath)
        
        self.showButtons()
        
    }
    
}
