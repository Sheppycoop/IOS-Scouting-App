//
//  teleopVC.swift
//  Pit Scout
//
//  Created by Casey Cooper on 2/5/18.
//  Copyright © 2018 Casey Cooper. All rights reserved.
//

import UIKit

class teleopVC: UIViewController {
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var teamNumTF: UITextField!
    @IBOutlet weak var roundNumTF: UITextField!
    
    @IBOutlet weak var disabledSwitch: UISwitch!
    @IBOutlet weak var incapacitatedSwitch: UISwitch!
    
    @IBOutlet weak var climbSwitch: UISwitch!
    @IBOutlet weak var climbedOtherSwitch: UISwitch!
    
    @IBOutlet weak var climbedbyOtherSwitch: UISwitch!
    
    @IBOutlet weak var scaleLabel: UILabel!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var exchangeLabel: UILabel!
    @IBOutlet weak var fumbledLabel: UILabel!
    
//adding and taking from scale
    @IBOutlet weak var onScaleAddTapped: UIButton!
    
    @IBOutlet weak var onScaleSubtractTapped: UIButton!
    
    
    @IBOutlet weak var onSwitchAddTapped: UIButton!
    
    @IBOutlet weak var onSwitchSubtractTapped: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
