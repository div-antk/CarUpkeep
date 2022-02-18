//
//  LiabilityInsuranceTableViewCell.swift
//  CarUpkeep
//
//  Created by Takuya Ando on 2022/01/10.
//

import UIKit
import Instantiate
import InstantiateStandard

class LiabilityInsuranceTableViewCell: UITableViewCell, Reusable {

    @IBOutlet weak var tilteLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var bgLayerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
