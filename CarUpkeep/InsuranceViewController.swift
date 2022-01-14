//
//  InsuranceViewController.swift
//  CarUpkeep
//
//  Created by Takuya Ando on 2022/01/05.
//

import UIKit
import Instantiate

class InsuranceViewController: UIViewController, StoryboardInstantiatable {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 270
        tableView.rowHeight = UITableView.automaticDimension
        
        // カスタムセルを登録
        tableView.register(UINib(nibName: TitleTableViewCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: TitleTableViewCell.reusableIdentifier)

        tableView.register(UINib(nibName: LiabilityInsuranceTableViewCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: LiabilityInsuranceTableViewCell.reusableIdentifier)
        
        tableView.register(UINib(nibName: InsuranceTableViewCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: InsuranceTableViewCell.reusableIdentifier)
        
        tableView.register(UINib(nibName: ResultTableViewCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: ResultTableViewCell.reusableIdentifier)
        
    }
}

extension InsuranceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let titleCell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.reusableIdentifier, for: indexPath) as? TitleTableViewCell else {
            return UITableViewCell()
        }
        
        switch indexPath.item {
        case 0:
            titleCell.titleLabel.text = "*自賠責保険"
            titleCell.subtitleLabel.text = "24ヶ月のだいたいの金額です"
            
            return titleCell
            
        case 1:
            guard let resultCell = tableView.dequeueReusableCell(withIdentifier: LiabilityInsuranceTableViewCell.reusableIdentifier, for: indexPath) as? LiabilityInsuranceTableViewCell else {
                return UITableViewCell()
            }
           
            resultCell.tilteLabel.text = "*自賠責保険"
            resultCell.priceLabel.text = "25,000"
            
            return resultCell
            
        case 2:
            titleCell.titleLabel.text = "*任意保険"
            titleCell.subtitleLabel.text = ""
            
            return titleCell
        
        case 3:
            guard let insuranceCell = tableView.dequeueReusableCell(withIdentifier: InsuranceTableViewCell.reusableIdentifier, for: indexPath) as? InsuranceTableViewCell else {
                return UITableViewCell()
            }
            print("(´・ω・｀)", insuranceCell)
            return insuranceCell
            
        default:
            return UITableViewCell()
        }
    }
}
