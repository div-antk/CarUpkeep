//
//  TaxViewController.swift
//  CarUpkeep
//
//  Created by Takuya Ando on 2022/01/02.
//

import UIKit
import Instantiate
import RxSwift
import RxCocoa

class TaxViewController: UIViewController, StoryboardInstantiatable {
    
    @IBOutlet weak var tableView: UITableView!
    
    var displacement: Int = 0
    var keiCarFlg: Bool = false
    var thirteenFlg: Bool = false
    var hybridCarFlg: Bool = false
        
    private let disposeBag = DisposeBag()
    
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

extension TaxViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let titleCell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.reusableIdentifier, for: indexPath) as? TitleTableViewCell else {
            return UITableViewCell()
        }
        
        switch indexPath.item {
        case 0:
            titleCell.titleLabel.text = "*自動車税"
            titleCell.subtitleLabel.text = ""
            
            return titleCell
            
        case 1:
            guard let automobileTaxCell = tableView.dequeueReusableCell(withIdentifier: AutomobileTaxTableViewCell.reusableIdentifier, for: indexPath) as? AutomobileTaxTableViewCell else {
                return UITableViewCell()
            }
           
            automobileTaxCell.displacementTextField.rx.text.orEmpty.asDriver()
                .drive(onNext: { [weak self] displacement in
                    self?.displacement = Int(displacement) ?? 0
                }).disposed(by: disposeBag)

            automobileTaxCell.keiCarSwitch.rx.value.share(replay: 1)
                .subscribe(onNext: { [weak self] isKeiCar in
                    if isKeiCar {
                        self?.keiCarFlg = true
                    } else {
                        self?.keiCarFlg = false
                    }
                }).disposed(by: disposeBag)
            
            automobileTaxCell.thirteenSwitch.rx.value.share(replay: 1)
                .subscribe(onNext: { [weak self] isThirteen in
                    if isThirteen {
                        self?.thirteenFlg = true
                    } else {
                        self?.thirteenFlg = false
                    }
                }).disposed(by: disposeBag)
            
            automobileTaxCell.hybridCarSwitch.rx.value.share(replay: 1)
                .subscribe(onNext: { [weak self] isHybridCar in
                    if isHybridCar {
                        self?.hybridCarFlg = true
                    } else {
                        self?.hybridCarFlg = false
                    }
                }).disposed(by: disposeBag)
            
            return automobileTaxCell
            
        case 2:
            guard let resultCell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.reusableIdentifier, for: indexPath) as? ResultTableViewCell else {
                return UITableViewCell()
            }
            
            resultCell.tilteLabel.text = "*自動車税"
            
            return resultCell
            
        case 3:
            titleCell.titleLabel.text = "*重量税"
            titleCell.subtitleLabel.text = ""
            
            return titleCell
            
        case 4:
            guard let weightTaxCell = tableView.dequeueReusableCell(withIdentifier: WeightTaxTableViewCell.reusableIdentifier, for: indexPath) as? WeightTaxTableViewCell else {
                return UITableViewCell()
            }
            
            return weightTaxCell
            
        case 5:
            guard let resultCell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.reusableIdentifier, for: indexPath) as? ResultTableViewCell else {
                return UITableViewCell()
            }
            
            resultCell.tilteLabel.text = "*重量税"
            
            return resultCell
            
        default:
            return UITableViewCell()
        }
    }
}
