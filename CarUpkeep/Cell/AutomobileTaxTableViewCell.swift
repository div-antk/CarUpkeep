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
    @IBOutlet weak var displacementTextView: NSLayoutConstraint!
    
    @IBOutlet weak var keiCarSwitch: UISwitch!
    @IBOutlet weak var thirteenSwitch: UISwitch!
    @IBOutlet weak var hybridCarSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        bgLayerView.layer.borderWidth = 2
        bgLayerView.layer.borderColor = UIColor.white.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
