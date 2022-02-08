//
//  PriceViewModel.swift
//  CarUpkeep
//
//  Created by Takuya Ando on 2022/02/06.
//

import Foundation
import RxSwift
import RxCocoa

// プロトコルを適用したクラスや構造体は、プロトコルに定義されているメソッド、プロパティを必ず実装しなければならない

// VCから受ける
protocol PriceViewModelInputs {
    func priceCulc(pirce: String, installments: String, interst: String)
}

// VCに送る
protocol PriceViewModelOutputs {
    var result: Observable<Int> { get }
}

protocol PriceViewModelType {
    var inputs: PriceViewModelInputs { get }
    var outputs: PriceViewModelOutputs { get }
}

class PriceViewModel: PriceViewModelOutputs {
    
    // MARK: - output
    var result: Observable<Int>

    // MARK: - other
    private let disposeBag = DisposeBag()

    // classのプロパティの初期値を設定する
    // このクラスのインスタンスを生成する際に自動で呼び出される
    init() {
        let _result = PublishRelay<Int>()
        self.result = _result.asObservable()

    }
    
}

extension PriceViewModel: PriceViewModelInputs {
    func priceCulc(pirce: String, installments: String, interst: String) {
        //
    }
}

extension PriceViewModel: PriceViewModelType {
    var inputs: PriceViewModelInputs { self }
    var outputs: PriceViewModelOutputs { self }
}
