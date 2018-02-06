//
//  AutoVC.swift
//  Pit Scout
//
//  Created by Casey Cooper on 2/5/18.
//  Copyright © 2018 Casey Cooper. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class AutoVC: UIViewController {
    // These are the outlets for the mutable data fields in the storyboard
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var teamNumTF: UITextField!
    @IBOutlet weak var roundNumTF: UITextField!
    @IBOutlet weak var scaleSwitch: UISwitch!
    @IBOutlet weak var switchSwitch: UISwitch!
    @IBOutlet weak var field: UILabel!
    var refData: DatabaseReference!
    var switchscale = "No"
    var didswitchswitch = "No"
   var blocksPickedUp = 0
    @IBAction func onMinusTapped(_ sender: Any) {
        if blocksPickedUp != 0 {
            blocksPickedUp -= 1
            let blocks: String = String(blocksPickedUp)
            field.text = blocks
        }
        else {
            field.text = "0"
        }
    }
    
    @IBAction func onPlusTapped(_ sender: Any) {
        blocksPickedUp += 1
        let blocks: String = String(blocksPickedUp)
        field.text = blocks
    }
    
    
    
    @IBAction func onScaleSwitchTapped(_ sender: Any) {
        if scaleSwitch.isOn {
            switchscale = "Yes"
        }
        else {
            switchscale = "No"
        }
}
    
    @IBAction func onSwitchSwitchTapped(_ sender: Any) {
        if switchSwitch.isOn {
            didswitchswitch = "Yes"
        }
        else {
            didswitchswitch = "No"
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refData = Database.database().reference().child("Teams")
    }
 
    func addData() {
        let blocks = field.text
        let data = [
            "Did put a block on the scale": switchscale,
            "Did put a block on the switch": didswitchswitch,
            "Number of blocks placed": blocks
            ]
        
        
        
        refData.child("Team " + teamNumTF.text!).child("Round " + roundNumTF.text!).child(userNameTF.text!).child("Auton").setValue(data)
    }
    
    
    @IBAction func onSubmitTapped(_ sender: Any) {
        // make sure the fields are empty
        guard let userName = userNameTF.text,
        userName != "",
        let teamNum = teamNumTF.text,
        teamNum != "",
        let roundNum = roundNumTF.text,
        roundNum != ""
        else{
                AlertController.showAlert(inViewController: self, title: "Missing Data", message: "Please fill out all fields")
                return
        }
        
        addData()
        
        self.performSegue(withIdentifier: "page2Segue", sender: nil)
    }
    
    
    
}
