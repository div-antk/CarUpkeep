//
//  PriceTableViewCell.swift
//  CarUpkeep
//
//  Created by Takuya Ando on 2022/01/19.
//

import UIKit
import Instantiate
import InstantiateStandard

class PriceTableViewCell: UITableViewCell, Reusable {

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
