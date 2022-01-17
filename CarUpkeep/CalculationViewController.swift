//
//  ViewController.swift
//  CarUpkeep
//
//  Created by Takuya Ando on 2021/12/23.
//

import UIKit
import Instantiate
import Parchment

class CalculationViewController: UIViewController, StoryboardInstantiatable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initPagingVC()
        
        // 領域外タップでキーボードを閉じる
        setDismissKeyboard()
    }
    
    private func initPagingVC() {
       
        let priceVC = PriceViewController.instantiate()
        priceVC.title = "車両価格"
        
        let taxVC = TaxViewController.instantiate()
        taxVC.title = "税金"
       
        let insuranceVC = InsuranceViewController.instantiate()
        insuranceVC.title = "保険"
        
        let pagingVC = PagingViewController(viewControllers: [
            priceVC,
            taxVC,
            insuranceVC
        ])
        
        addChild(pagingVC)
        view.addSubview(pagingVC.view)
        pagingVC.didMove(toParent: self)
        pagingVC.view.translatesAutoresizingMaskIntoConstraints = false
      
        // 表示設定
        pagingVC.textColor = .black
        pagingVC.selectedTextColor = .white
        pagingVC.indicatorColor = .white
        pagingVC.backgroundColor = .darkGray
        pagingVC.selectedBackgroundColor = .darkGray
        
        // インジケーターの設定
//        pagingVC.indicatorOptions = .visible(
//            height: 4,
//            zIndex: Int.max,
//            spacing: UIEdgeInsets.zero,
//            insets: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
        
        NSLayoutConstraint.activate([
            pagingVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pagingVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pagingVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pagingVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }

}
