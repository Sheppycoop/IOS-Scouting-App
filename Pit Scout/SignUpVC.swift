//
//  SignUpVC.swift
//  Pit Scout
//
//  Created by Casey Cooper on 1/18/18.
//  Copyright © 2018 Casey Cooper. All rights reserved.
//

import UIKit
import Firebase



    
class SignUpVC: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var teampinTF: UITextField!
    
    
    


    
    @IBAction func onSignUpTapped(_ sender: Any) {
        let username = usernameTF.text
        let email = emailTF.text
        let password = passwordTF.text
        if teampinTF.text != "3495" {
            AlertController.showAlert(inViewController: self, title: "Missing or Incorrect PIN", message: "Your team PIN is missing or incorrect")
            return
        }
        else if usernameTF.text == "" {
            AlertController.showAlert(inViewController: self, title: "Missing Username", message: "Your username is missing")
            return
            }
        else if emailTF.text == "" {
            AlertController.showAlert(inViewController: self, title: "Missing Email", message: "Your email address is missing")
            return
            }
        else if passwordTF.text == "" {
            AlertController.showAlert(inViewController: self, title: "Missing Password", message: "Your password is missing")
            return
        }
        else {

            
            
        Auth.auth().createUser(withEmail: email!, password: password!, completion: { (user, error) in
            
            guard error == nil else {
                AlertController.showAlert(inViewController: self, title: "Error", message: error!.localizedDescription)
                return
            }
            
            guard let user = user else { return }
            print(user.email ??  "MISSING EMAIL")
            print(user.uid)
            
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = username
            changeRequest.commitChanges(completion: { (error) in
                guard error == nil else {
                    AlertController.showAlert(inViewController: self, title: "Error", message: error!.localizedDescription)
                    return
                }
                
                
                self.performSegue(withIdentifier: "signUpSegue", sender: nil)
            })
            
        })
    
    }
}
}
