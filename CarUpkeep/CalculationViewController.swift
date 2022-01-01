//
//  ViewController.swift
//  CarUpkeep
//
//  Created by Takuya Ando on 2021/12/23.
//

import UIKit
import Instantiate

class CalculationViewController: UIViewController, StoryboardInstantiatable {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 270
        tableView.rowHeight = UITableView.automaticDimension
        
        // カスタムセルを登録
        tableView.register(UINib(nibName: TitleTableViewCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: TitleTableViewCell.reusableIdentifier)
        
        tableView.register(UINib(nibName: AutomobileTaxTableViewCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: AutomobileTaxTableViewCell.reusableIdentifier)

        tableView.register(UINib(nibName: WeightTaxTableViewCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: WeightTaxTableViewCell.reusableIdentifier)

        tableView.register(UINib(nibName: ResultTableViewCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: ResultTableViewCell.reusableIdentifier)
        
    }

}

extension CalculationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.item {
        case 0:
            guard let titleCell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.reusableIdentifier, for: indexPath) as? TitleTableViewCell else {
                return UITableViewCell()
            }
            
            titleCell.titleLabel.text = "税金"
            titleCell.subtitleLabel.text = "絶対にかかるお金です💸"
            
            return titleCell
            
        case 1:
            guard let automobileTaxCell = tableView.dequeueReusableCell(withIdentifier: AutomobileTaxTableViewCell.reusableIdentifier, for: indexPath) as? AutomobileTaxTableViewCell else {
                return UITableViewCell()
            }
            
            return automobileTaxCell
        
        case 2:
            guard let resultCell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.reusableIdentifier, for: indexPath) as? ResultTableViewCell else {
                return UITableViewCell()
            }
           
            resultCell.tilteLabel.text = "自動車税"
            
            return resultCell
            
         case 3:
            guard let weightTaxCell = tableView.dequeueReusableCell(withIdentifier: WeightTaxTableViewCell.reusableIdentifier, for: indexPath) as? WeightTaxTableViewCell else {
                return UITableViewCell()
            }
            
            return weightTaxCell
            
         case 4:
            guard let resultCell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.reusableIdentifier, for: indexPath) as? ResultTableViewCell else {
                return UITableViewCell()
            }
            
            resultCell.tilteLabel.text = "重量税"
            
            return resultCell
            
        default:
            return UITableViewCell()
        }
        
    }
    
}
