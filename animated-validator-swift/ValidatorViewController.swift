//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        self.emailTextField.delegate = self
        self.emailConfirmationTextField.delegate = self
        self.phoneTextField.delegate = self
        self.passwordTextField.delegate = self
        self.passwordConfirmTextField.delegate = self
        
        
        
        self.submitButton.enabled = false
        
    }
    
    func checkEmail() {
        let atSign = "@"
        
        if self.emailTextField.text?.containsString(atSign) == true {
            [UIView.animateWithDuration(0.5, animations: {
                self.emailTextField.backgroundColor = UIColor.clearColor()
                
            })]
        }else {
            
            [UIView.animateWithDuration(0.5, animations: {
                self.emailTextField.backgroundColor = UIColor.redColor()
                
            })]
        }
    }
    
    func confirmEmail() {
        if self.emailConfirmationTextField.text == self.emailTextField.text {
            [UIView.animateWithDuration(0.5, animations: {
                self.emailConfirmationTextField.backgroundColor = UIColor.clearColor()
                
            })]
        }else {
            [UIView.animateWithDuration(0.5, animations: {
                self.emailConfirmationTextField.backgroundColor = UIColor.redColor()
                
            })]
        }
    }
    
    func checkPhoneNumber() {
        
        let numbers = ["0","1","2","3","4","5","6","7","8","9"]
        
        for number in numbers {
            
            if self.phoneTextField.text?.characters.count < 7 || self.phoneTextField.text?.containsString(number) == true {
                [UIView.animateWithDuration(0.5, animations: {
                    self.phoneTextField.backgroundColor = UIColor.redColor()
                    
                })]

            }else {
                [UIView.animateWithDuration(0.5, animations: {
                    self.phoneTextField.backgroundColor = UIColor.clearColor()
                    
                })]
            }
        }
    }
    
    func checkPassword() {
        
        if self.passwordTextField.text?.characters.count < 6 {
            [UIView.animateWithDuration(0.5, animations: {
                self.passwordTextField.backgroundColor = UIColor.redColor()
                
            })]
        }else {
            [UIView.animateWithDuration(0.5, animations: {
                self.passwordTextField.backgroundColor = UIColor.clearColor()
                
            })]
            
        }
    }
    
    func confirmPassword() {
        if self.passwordConfirmTextField.text == self.passwordTextField.text {
            [UIView.animateWithDuration(0.5, animations: {
                self.passwordConfirmTextField.backgroundColor = UIColor.clearColor()
                self.submitButton.enabled = true

            })]
            

        }else {
            [UIView.animateWithDuration(0.5, animations: {
                self.passwordConfirmTextField.backgroundColor = UIColor.redColor()
            })]
            
        }
    }
    
    
    @IBAction func emailTextAction(sender: AnyObject) {
    
       checkEmail()
    }
    
    @IBAction func confirmEmailAction(sender: AnyObject) {
        confirmEmail()
        
    }
    @IBAction func phoneAction(sender: AnyObject) {
        checkPhoneNumber()
    }
    @IBAction func passwordAction(sender: AnyObject) {
        checkPassword()
    }
    @IBAction func confirmPasswordAction(sender: AnyObject) {
        confirmPassword()
    }
    


}