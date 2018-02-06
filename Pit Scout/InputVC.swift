//
//  InputVC.swift
//  Pit Scout
//
//  Created by Casey Cooper on 1/27/18.
//  Copyright © 2018 Casey Cooper. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class InputVC: UIViewController {
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var teamNumberTF: UITextField!
    @IBOutlet weak var roundNumberTF: UITextField!
    @IBOutlet weak var driveTrainTF: UITextField!
    @IBOutlet weak var canClimbTF: UITextField!
    @IBOutlet weak var climbOthersTF: UITextField!
    @IBOutlet weak var switchScaleTF: UITextField!
    var refData: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        refData = Database.database().reference().child("Teams")
    }
    
    
    func addData(){

        let data = [
            
                    "Drivetrain Type": driveTrainTF.text! as String,
                     "Can Climb": canClimbTF.text! as String,
                     "Can Climb Other Robots": climbOthersTF.text! as String,
                     "Went for Switch or Scale First": switchScaleTF.text! as String
        ]
        
        
        refData.child("Team " + teamNumberTF.text!).child("Round " + roundNumberTF.text!).child(usernameTF.text!).child("Teleop").setValue(data)

        
    }
    
    @IBAction func onSubmitTapped(_ sender: Any) {
        guard let driveTrain = driveTrainTF.text,
        driveTrain != "",
        let canClimb = canClimbTF.text,
        canClimb != "",
        let climbOthers = climbOthersTF.text,
        climbOthers != "",
        let switchScale = switchScaleTF.text,
        switchScale != "",
        let username = usernameTF.text,
        username != "",
        let teamNumber = teamNumberTF.text,
        teamNumber != "",
        let roundNumber = roundNumberTF.text,
        roundNumber != ""
            else {
                AlertController.showAlert(inViewController: self, title: "Missing Info", message: "Please fill out all fields")
                return
        }
        
        addData()
        
        self.performSegue(withIdentifier: "fromInputSegue", sender: nil)
        
    }
    

}
