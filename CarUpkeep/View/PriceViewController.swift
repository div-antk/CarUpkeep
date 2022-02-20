//
//  PriceViewController.swift
//  CarUpkeep
//
//  Created by Takuya Ando on 2022/01/16.
//

import UIKit
import Instantiate
import RxSwift
import RxCocoa

class PriceViewController: UIViewController, StoryboardInstantiatable {

    @IBOutlet weak var tableView: UITableView!
    
    var price: Int = 0
    var installments: Int = 0
    var interest: Int = 0
    var result: Int = 0
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 270
        tableView.rowHeight = UITableView.automaticDimension
        
        // カスタムセルを登録
        tableView.register(UINib(nibName: TitleTableViewCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: TitleTableViewCell.reusableIdentifier)
        
        tableView.register(UINib(nibName: PriceTableViewCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: PriceTableViewCell.reusableIdentifier)
        
        tableView.register(UINib(nibName: ResultTableViewCell.reusableIdentifier, bundle: nil), forCellReuseIdentifier: ResultTableViewCell.reusableIdentifier)
        
    }
}

extension PriceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let titleCell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.reusableIdentifier, for: indexPath) as? TitleTableViewCell else {
            return UITableViewCell()
        }
        
        switch indexPath.item {
        case 0:
            titleCell.titleLabel.text = "*車両価格"
            titleCell.subtitleLabel.text = "ローンがある場合設定してください"
            
            return titleCell
            
        case 1:
            guard let priceCell = tableView.dequeueReusableCell(withIdentifier: PriceTableViewCell.reusableIdentifier, for: indexPath) as? PriceTableViewCell else {
                return UITableViewCell()
            }
           
            priceCell.priceTextField.rx.text.orEmpty.asDriver()
                .drive(onNext: { [weak self] price in
                    self?.price = Int(price) ?? 0
                }).disposed(by: disposeBag)
            
            self.installments = priceCell.installments
            self.interest = priceCell.interest

            return priceCell
            
        case 2:
            guard let resultCell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.reusableIdentifier, for: indexPath) as? ResultTableViewCell else {
                return UITableViewCell()
            }
            
            resultCell.tilteLabel.text = "*ローン"
//            resultCell.priceLabel.text = String(result)
           
            resultCell.resultButton.rx.tap.subscribe({ [weak self] _ in
                if let price = self?.price {
                    self?.result = price / 12
                    print(price, self?.result)
                }
//                resultCell.priceLabel.text

            }).disposed(by: disposeBag)
            
            return resultCell
            
        default:
            return UITableViewCell()
        }
    }
    
    
    func priceCalc(price: Int, installments: Int, interest: Int) -> String {
        let result = String(price / 24)
        return result
    }
}
