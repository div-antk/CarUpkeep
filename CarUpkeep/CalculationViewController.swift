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
    }
    
    private func initPagingVC() {
       
        let taxViewController = TaxViewController.instantiate()
        taxViewController.title = "税金"
        
        let pagingVC = PagingViewController(viewControllers: [
            taxViewController
        ])
        addChild(pagingVC)
        view.addSubview(pagingVC.view)
        pagingVC.didMove(toParent: self)
        pagingVC.view.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            pagingVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pagingVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pagingVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pagingVC.view.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }

}
