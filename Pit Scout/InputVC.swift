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
//let db = Firestore.firestore()
class InputVC: UIViewController {
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var driveTrainTF: UITextField!
    @IBOutlet weak var canClimbTF: UITextField!
    @IBOutlet weak var climbOthersTF: UITextField!
    @IBOutlet weak var switchScaleTF: UITextField!
    var refData: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    
        refData = Database.database().reference().child("scoutingDataIOS")
        
    }
    
    func addData(){
        let key = usernameTF.text
        
        let data = [ "id":key,
                     "driveTrainType": driveTrainTF.text! as String
        ]
        refData.child(key!).setValue(data)
        
        
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
        username != ""
            else {
                AlertController.showAlert(inViewController: self, title: "Missing Info", message: "Please fill out all fields")
                return
        }
        
        
        addData()
        
        
        
        
        
        
        
//        self.performSegue(withIdentifier: "fromInputSegue", sender: nil)
        
        
        
        
        
        
    }
    

}
