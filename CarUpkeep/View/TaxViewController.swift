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
    var carTaxkeiCarFlg: Bool = false
    var carTax13Flg: Bool = false
    
    var weight: Int = 0
    var weightTax13Flg: Bool = false
    var weightTax18Flg: Bool = false
    var weightTaxkeiCarFlg: Bool = false
    
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
                    self?.displacement = self?.displacementDetermine(displacement: Int(displacement) ?? 0) ?? 0
                }).disposed(by: disposeBag)

            automobileTaxCell.keiCarSwitch.rx.value.share(replay: 1)
                .subscribe(onNext: { [weak self] isKeiCar in
                    if isKeiCar {
                        self?.carTaxkeiCarFlg = true
                    } else {
                        self?.carTaxkeiCarFlg = false
                    }
                }).disposed(by: disposeBag)
            
            automobileTaxCell.thirteenSwitch.rx.value.share(replay: 1)
                .subscribe(onNext: { [weak self] isThirteen in
                    if isThirteen {
                        self?.carTax13Flg = true
                    } else {
                        self?.carTax13Flg = false
                    }
                }).disposed(by: disposeBag)
            
            return automobileTaxCell
            
        case 2:
            guard let resultCell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.reusableIdentifier, for: indexPath) as? ResultTableViewCell else {
                return UITableViewCell()
            }
            
            resultCell.tilteLabel.text = "*自動車税"
           
            resultCell.resultButton.rx.tap.subscribe({ [weak self] _ in
                if
                    let displacement = self?.displacement,
                    let keiCarFlg = self?.carTaxkeiCarFlg,
                    let carTax13Flg = self?.carTax13Flg
                {
                    let result = self?.automobileTaxCalc(displacement: displacement, isKeiCar: keiCarFlg, isThirteen: carTax13Flg)
                    resultCell.priceLabel.text = result
                }
            }).disposed(by: disposeBag)
            
            return resultCell
            
        case 3:
            titleCell.titleLabel.text = "*重量税"
            titleCell.subtitleLabel.text = ""
            
            return titleCell
            
        case 4:
            guard let weightTaxCell = tableView.dequeueReusableCell(withIdentifier: WeightTaxTableViewCell.reusableIdentifier, for: indexPath) as? WeightTaxTableViewCell else {
                return UITableViewCell()
            }
            
            weightTaxCell.weightTextField.rx.text.orEmpty.asDriver()
                .drive(onNext: { [weak self] weight in
                    self?.weight = Int(self?.weightDetermine(weight: Double(weight) ?? 0) ?? 0)
                }).disposed(by: disposeBag)
            
            weightTaxCell.thirteenSwitch.rx.value.share(replay: 1)
                .subscribe(onNext: { [weak self] isThirteen in
                    if isThirteen {
                        self?.weightTax13Flg = true
                    } else {
                        self?.weightTax13Flg = false
                    }
                }).disposed(by: disposeBag)
            
            weightTaxCell.thirteenSwitch.rx.value.share(replay: 1)
                .subscribe(onNext: { [weak self] isThirteen in
                    if isThirteen {
                        self?.weightTax18Flg = true
                    } else {
                        self?.weightTax18Flg = false
                    }
                }).disposed(by: disposeBag)
            
            weightTaxCell.keiCarSwitch.rx.value.share(replay: 1)
                .subscribe(onNext: { [weak self] isKeiCar in
                    if isKeiCar {
                        self?.weightTaxkeiCarFlg = true
                    } else {
                        self?.weightTaxkeiCarFlg = false
                    }
                }).disposed(by: disposeBag)
            
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
    
    func displacementDetermine(displacement: Int) -> Int {
        
        if displacement > 6000 {
            return 111000
        }
        
        switch displacement {
        case 1...1000:
            return 29500
        case 1001...1500:
            return 34500
        case 1501...2000:
            return 39500
        case 2001...2500:
            return 45000
        case 2501...3000:
            return 51000
        case 3001...3500:
            return 58000
        case 3501...4000:
            return 66500
        case 4001...4500:
            return 76500
        case 4501...6000:
            return 88000
        default:
            return 0
        }
    }
      
    func weightDetermine(weight: Double) -> Int {
        
        if weight <= 0.5 && weight != 0 {
            return 8200
        }

        switch weight {
        case 0.5...1:
            return 16400
        case 1...1.5:
            return 24600
        case 1.5...2:
            return 32800
        case 2...2.5:
            return 41000
        case 2.5...3:
            return 49200
        default:
            return 0
        }
    }
    
    func automobileTaxCalc(displacement: Int, isKeiCar: Bool, isThirteen: Bool) -> String {

        if isKeiCar == true && isThirteen == true {
            self.displacement = 0
            return "1,075"
        } else if isKeiCar == true {
            self.displacement = 0
            return "900"
        } else if displacement > 0 && isThirteen {
            // 新規登録から13年経過した車はグリーン化税制によって税率が15%アップ
            let greenTax = Double(displacement) * 0.15
            // 結果を12で割って月額を算出。3桁ごとにカンマ区切りにする
            return String.localizedStringWithFormat("%d", Int(Double(displacement) + greenTax) / 12)
        } else if displacement > 0 {
            return String.localizedStringWithFormat("%d", displacement / 12)
        } else {
            return "0"
        }
    }
    
    func weightTaxCalc(weight: Int, isKeiCar: Bool, isThirteen: Bool, isEighteen: Bool) -> String {
        print(weight, isKeiCar, isThirteen, isEighteen)
        if isKeiCar == true && isThirteen == true {
            self.displacement = 0
            return ""
        } else if isKeiCar == true && isEighteen == true {

            return ""
        } else if isKeiCar == true {
            self.displacement = 0
            return ""
        } else if displacement > 0 && isThirteen {
            // 新規登録から13年経過した車はグリーン化税制によって税率が15%アップ
            let greenTax = Double(displacement) * 0.15
            // 結果を12で割って月額を算出。3桁ごとにカンマ区切りにする
            return String.localizedStringWithFormat("%d", Int(Double(displacement) + greenTax) / 12)
        } else if displacement > 0 {
            return String.localizedStringWithFormat("%d", displacement / 12)
        } else {
            return "0"
        }
    }
}
