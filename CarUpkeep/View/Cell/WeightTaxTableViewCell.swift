//
//  WeightTaxTableViewCell.swift
//  CarUpkeep
//
//  Created by Takuya Ando on 2021/12/26.
//

import UIKit
import Instantiate
import InstantiateStandard

class WeightTaxTableViewCell: UITableViewCell, Reusable {

    @IBOutlet weak var bgLayerView: UIView!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var keiCarSwitch: UISwitch!
    @IBOutlet weak var thirteenSwitch: UISwitch!
    @IBOutlet weak var eighteenSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgLayerView.layer.borderWidth = 2
        bgLayerView.layer.borderColor = UIColor.white.cgColor
    }

    @IBAction func weightTextField(_ sender: UITextField) {
        
        if sender.text!.count > 0 {
            keiCarSwitch.isOn = false
            sender.backgroundColor = .white
        }
    }
    
    @IBAction func keiCarSwitch(_ sender: UISwitch) {
        if sender.isOn {
            weightTextField.text = ""
            weightTextField.backgroundColor = .orange
        } else {
            weightTextField.backgroundColor = .white
        }
    }
    
    @IBAction func thirteenSwitch(_ sender: UISwitch) {
        if sender.isOn {
            eighteenSwitch.isOn = false
        }
    }
    
    @IBAction func eighteenSwitch(_ sender: UISwitch) {
        if sender.isOn {
            thirteenSwitch.isOn = false
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
