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
    @IBOutlet weak var resultButton: UIButton!
    
    @IBOutlet weak var bgViewTopMargin: NSLayoutConstraint!
    @IBOutlet weak var bgViewLeftMargin: NSLayoutConstraint!
    @IBOutlet weak var bgViewRightMargin: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    @IBAction func bgButton(_ sender: UIButton) {
        
        bgViewTopMargin.constant = 8
        bgViewLeftMargin.constant = 8
        bgViewRightMargin.constant = 0
    }
    
    @IBAction func bgButtonTouchUpInside(_ sender: UIButton) {
        
        bgViewTopMargin.constant = 0
        bgViewLeftMargin.constant = 0
        bgViewRightMargin.constant = 8
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
