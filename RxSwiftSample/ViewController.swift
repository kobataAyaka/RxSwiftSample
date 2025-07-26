//
//  ViewController.swift
//  RxSwiftSample
//
//  Created by 小幡綾加 on 7/26/25.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    private let viewModel = CounterViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plusButton.rx.tap
            .bind(to: viewModel.plusTapped)
            .disposed(by: disposeBag)
        
        minusButton.rx.tap
            .bind(to: viewModel.minusTapped)
            .disposed(by: disposeBag)
        
        resetButton.rx.tap
            .bind(to: viewModel.resetTapped)
            .disposed(by: disposeBag)
        
        viewModel.countText
            .drive(countLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

