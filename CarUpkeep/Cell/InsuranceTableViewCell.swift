//
//  InsuranceTableViewCell.swift
//  CarUpkeep
//
//  Created by Takuya Ando on 2021/12/30.
//

import UIKit
import Instantiate
import InstantiateStandard

class InsuranceTableViewCell: UITableViewCell, Reusable {

    @IBOutlet weak var bgLayerView: UIView!
    
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
