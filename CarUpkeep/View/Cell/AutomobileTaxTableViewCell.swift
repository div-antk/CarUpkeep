//
//  AutomobileTaxTableViewCell.swift
//  CarUpkeep
//
//  Created by Takuya Ando on 2021/12/26.
//

import UIKit
import Instantiate
import InstantiateStandard

class AutomobileTaxTableViewCell: UITableViewCell, Reusable {

    @IBOutlet weak var bgLayerView: UIView!
    @IBOutlet weak var displacementTextField: UITextField!
    @IBOutlet weak var keiCarSwitch: UISwitch!
    @IBOutlet weak var thirteenSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        bgLayerView.layer.borderWidth = 2
        bgLayerView.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func displacementTextField(_ sender: UITextField) {
   
        if sender.text!.count > 0 {
            keiCarSwitch.isOn = false
            sender.backgroundColor = .white
        }
    }
    
    @IBAction func keiCarSwitch(_ sender: UISwitch) {
        
        if sender.isOn {
            displacementTextField.text = ""
            displacementTextField.backgroundColor = .orange
        } else {
            displacementTextField.backgroundColor = .white
        }
    }
    
    @IBAction func thirteenSwitch(_ sender: UISwitch) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
