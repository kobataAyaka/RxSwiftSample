//
//  CounterViewModel.swift
//  RxSwiftSample
//
//  Created by 小幡綾加 on 7/26/25.
//

import RxSwift
import RxCocoa

class CounterViewModel {
    let countText: Driver<String>
    
    let plusTapped = PublishRelay<Void>()
    let minusTapped = PublishRelay<Void>()
    let resetTapped = PublishRelay<Void>()
    
    private let count = BehaviorRelay<Int>(value: 0)
    private let disposeBag = DisposeBag()
    
    init() {
        plusTapped
            .withLatestFrom(count)
            .map { $0 + 1 }
            .bind(to: count)
            .disposed(by: disposeBag)
        
        minusTapped
            .withLatestFrom(count)
            .filter { $0 > 0 }
            .map { $0 - 1 }
            .bind(to: count)
            .disposed(by: disposeBag)
        
        resetTapped
            .map { _ in 0 }
            .bind(to: count)
            .disposed(by: disposeBag)
        
        self.countText = count
            .map { String($0) }
            .asDriver(onErrorJustReturn: "Error!")
    }
}
