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

        tableView.register(UINib(nibName: ResultTableViewCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: ResultTableViewCell.reusableIdentifier)
        
    }
}

extension InsuranceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.item {
        case 0:
            guard let titleCell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.reusableIdentifier, for: indexPath) as? TitleTableViewCell else {
                return UITableViewCell()
            }
            
            titleCell.titleLabel.text = "保険"
            titleCell.subtitleLabel.text = "絶対にかかるお金です💸"
            
            return titleCell
            
        case 1:
            guard let resultCell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.reusableIdentifier, for: indexPath) as? ResultTableViewCell else {
                return UITableViewCell()
            }
           
            resultCell.tilteLabel.text = "自賠責保険"
            resultCell.priceLabel.text = "約25,000"
            
            return resultCell
            
        default:
            return UITableViewCell()
        }
    }
}
