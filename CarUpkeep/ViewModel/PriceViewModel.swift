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
    var installments: AnyObserver<String> { get }
    var interest: AnyObserver<String> { get }
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
    var installments: AnyObserver<String>
    var interest: AnyObserver<String>
    
    // MARK: - output
    var result: Observable<Int>

    // MARK: - other
    private let disposeBag = DisposeBag()

    // classのプロパティの初期値を設定する
    // このクラスのインスタンスを生成する際に自動で呼び出される
    init() {
        let _result = PublishRelay<Int>()
        self.result = _result.asObservable()
//
//        // すべての記事を取得（Moya）
//        ArticleRepository.getArticles()
//            .subscribe(onNext: { response in
//                _articles.accept(response)
//            })
//            .disposed(by: disposeBag)

        
        let _price = PublishRelay<String>()
        let _installments = PublishRelay<String>()
        let _interest = PublishRelay<String>()

//        self.price = AnyObserver<String>()
//        self.installments = AnyObserver<String>()
//        self.interest = AnyObserver<String>()
        
//        let _searchWord = PublishRelay<String>()
//        self.searchWord = AnyObserver<String> { event in
//            guard let text = event.element else { return }
//            _searchWord.accept(text)
//        }

    }
}

extension PriceViewModel: PriceViewModelType {
    var inputs: PriceViewModelInputs { self }
    var outputs: PriceViewModelOutputs { self }
}
