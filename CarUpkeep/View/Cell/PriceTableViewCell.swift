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
    
    var price: Int?
    var installments: Int = 0
    var interest: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()

        bgLayerView.layer.borderWidth = 2
        bgLayerView.layer.borderColor = UIColor.white.cgColor
        
        installments = Int(installmentsTextField.text ?? "0") ?? 0
        interest = Int(interestTextField.text ?? "0") ?? 0
        
    }

    @IBAction func priceTextField(_ sender: UITextField) {
        price = sender.textToInt
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
