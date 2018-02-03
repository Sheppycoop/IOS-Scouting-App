//
//  ViewController.swift
//  Pit Scout
//
//  Created by Casey Cooper on 1/17/18.
//  Copyright © 2018 Casey Cooper. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func onSubmitTapped(_ sender: Any) {
        
        guard let email = emailTF.text,
        email != "",
        let password = passwordTF.text,
        password != ""
            else {
                AlertController.showAlert(inViewController: self, title: "Missing Info", message: "Please fill out all required fields")
                    return
        }
        
        Auth.auth().signIn(withEmail: email, password: password, completion: {(user, error) in
            guard error == nil else {
                AlertController.showAlert(inViewController: self, title: "Error", message: error!.localizedDescription)
                return
            }
            guard let user = user else { return }
            print(user.email ?? "Missing Email")
            print(user.displayName ?? "Missing Username")
            print(user.uid)
            
            self.performSegue(withIdentifier: "signInSegue", sender: nil)
        })
        
        
    }
    
}

