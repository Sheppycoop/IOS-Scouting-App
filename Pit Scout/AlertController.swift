//
//  AlertController.swift
//  Pit Scout
//
//  Created by Casey Cooper on 1/22/18.
//  Copyright © 2018 Casey Cooper. All rights reserved.
//

import UIKit

class AlertController {
    static func showAlert(inViewController: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        inViewController.present(alert, animated: true, completion: nil)
        
    }
}
