//
//  KeyboardViewController.swift
//  BKeyBoard
//
//  Created by Joseph Hernandez on 5/23/16.
//  Copyright © 2016 Skgood Inc. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!

    @IBOutlet var deleteButton: UIButton!
    
    @IBOutlet var hideKeyboardButton: UIButton!
    
    var customInterface: UIView!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(customInterface)
        
        // Perform custom UI setup here
        addNextKeyboardButton()
//        self.nextKeyboardButton = UIButton(type: .System)
//    
//        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
//        self.nextKeyboardButton.sizeToFit()
//        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
//    
//        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
//        
//        self.view.addSubview(self.nextKeyboardButton)
//    
//        self.nextKeyboardButton.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor).active = true
//        self.nextKeyboardButton.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor).active = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }
    
    func addNextKeyboardButton()
    {
        self.nextKeyboardButton = UIButton(type: .System)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(UIInputViewController.advanceToNextInputMode), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor).active = true
        self.nextKeyboardButton.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor).active = true
    }
    
    //deletes button will use the deleteBackward from the textDocumentProxy to delete a character when pressed.
    func addDelete()
    {
        
        self.deleteButton = UIButton(type: .System)
        self.deleteButton.setTitle(NSLocalizedString("Delete", comment: "Title for 'Delete' button"), forState: .Normal)
        self.deleteButton.sizeToFit()
        self.deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.deleteButton.addTarget(self, action: #selector(KeyboardViewController.didTapDelete), forControlEvents: .TouchUpInside)
        
        self.deleteButton.backgroundColor = UIColor(white: 0.9, alpha: 1)
        self.deleteButton.layer.cornerRadius = 5
        
        self.view.addSubview(self.deleteButton)
        
        self.deleteButton.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor).active = true
        self.deleteButton.topAnchor.constraintEqualToAnchor(self.view.topAnchor).active = true

        
    }

    func didTapDelete()
    {
        let proxy = textDocumentProxy as UITextDocumentProxy
        
        proxy.deleteBackward()
    }
    
    //hideKeyBoard will call dismisskeyBoard on the keyboardviewontroller when pressed
    func addHideKeyboardButton()
    {
        self.hideKeyboardButton = UIButton(type: .System)
        self.hideKeyboardButton.setTitle(NSLocalizedString("Hide keyboard", comment: "Title for 'Hidekeyboard' button"), forState: .Normal)
        self.hideKeyboardButton.sizeToFit()
        self.hideKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.hideKeyboardButton.addTarget(self, action: #selector(UIInputViewController.dismissKeyboard), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.hideKeyboardButton)
        
        self.hideKeyboardButton.rightAnchor.constraintEqualToAnchor(self.view.rightAnchor).active = true
        self.hideKeyboardButton.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor).active = true
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        let nib = UINib(nibName: "CustomKeyboardInterface", bundle: nil)
        let objects = nib.instantiateWithOwner(self, options: nil)
        customInterface = objects[0] as! UIView
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    
    @IBAction func didTapWEmoji() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        
        proxy.insertText("We ❤ Swift")
    }
}
