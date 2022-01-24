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
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var installmentsTextField: UITextField!
    @IBOutlet weak var interestTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        bgLayerView.layer.borderWidth = 2
        bgLayerView.layer.borderColor = UIColor.white.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
