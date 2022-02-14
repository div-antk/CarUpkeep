//
//  ResultTableViewCell.swift
//  CarUpkeep
//
//  Created by Takuya Ando on 2021/12/26.
//

import UIKit
import Instantiate
import InstantiateStandard

class ResultTableViewCell: UITableViewCell, Reusable {
    
    @IBOutlet weak var tilteLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var bgLayerView: UIView!
    
    @IBOutlet weak var bgViewTopMargin: NSLayoutConstraint!
    @IBOutlet weak var bgViewLeftMargin: NSLayoutConstraint!
    @IBOutlet weak var bgViewRightMargin: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
//        bgLayerView.layer.borderWidth = 2
//        bgLayerView.layer.borderColor = UIColor.white.cgColor
    }

    @IBAction func bgButton(_ sender: UIButton) {
        
        bgViewTopMargin.constant = 12
        bgViewLeftMargin.constant = 24
        bgViewRightMargin.constant = 24
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
