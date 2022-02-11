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
    var price: AnyObserver<String> { get }
}

// VCに送る
protocol PriceViewModelOutputs {
    var result: Observable<Int> { get }
}

protocol PriceViewModelType {
    var inputs: PriceViewModelInputs { get }
    var outputs: PriceViewModelOutputs { get }
}

class PriceViewModel: PriceViewModelInputs, PriceViewModelOutputs {
    
    // MARK: - input
    var price: AnyObserver<String>
    
    // MARK: - output
    var result: Observable<Int>

    // MARK: - other
    private let disposeBag = DisposeBag()

    // classのプロパティの初期値を設定する
    // このクラスのインスタンスを生成する際に自動で呼び出される
    init() {
        let _price = PublishRelay<String>()
        self.price = AnyObserver<String> { event in
            guard let priceString = event.element else { return }
            _price.accept(priceString)
        }
        
        let _result = PublishRelay<Int>()
        self.result = _result.asObservable()
        
        _price
            .debounce(RxTimeInterval.seconds(1), scheduler: MainScheduler.instance)
            .flatMap { priceString in
//                priceString / 24
                priceCalc(priceString: priceString)
            }
            .subscribe(onNext: { result in
                _result.accept(result)
            })
            .disposed(by: disposeBag)
        
        // 検索で記事を取得（Moya）
//        _searchWord
//            .debounce(RxTimeInterval.seconds(1), scheduler: MainScheduler.instance)
//            .flatMap { searchWord in
//                ArticleRepository.searchArticles(searchWord: searchWord)
//            }
//            .subscribe(onNext: { response in
//                _articles.accept(response)
//            })
//            .disposed(by: disposeBag)

    }
    
    func priceCalc(priceString: String) -> Int {
        let price = Int(priceString) ?? 0
        return price / 12
    }
}

extension PriceViewModel: PriceViewModelType {
    var inputs: PriceViewModelInputs { self }
    var outputs: PriceViewModelOutputs { self }
}
