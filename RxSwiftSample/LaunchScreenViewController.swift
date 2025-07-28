//
//  LaunchScreenViewController.swift
//  RxSwiftSample
//
//  Created by 小幡綾加 on 7/28/25.
//

import UIKit
import Lottie

class LaunchScreenViewController: UIViewController {
    
    private let animationView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "Squid Game Symbols")
        animationView.contentMode = .scaleAspectFit
        return animationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(animationView)
        
        animationView.frame = view.bounds
        animationView.center = view!.center
        animationView.alpha = 1
        
        animationView.play { [weak self] _ in
            guard let self = self else { return }
            
            // LaunchScreen.storyboard대신 ViewController를 사용하는경우 다음 화면 지정이 필요합니다.
            // Storyboard에서 CounterViewController 인스턴스화 (사전에 StoryboardID를 설정할것)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let counterViewController = storyboard.instantiateViewController(withIdentifier: "CounterViewController") as! CounterViewController
            
            // CounterViewController를 전체 화면으로 표시
            counterViewController.modalPresentationStyle = .fullScreen
            
            // 애니메이션이 완료되면 CounterViewController로 전환
            self.present(counterViewController, animated: true, completion: nil)

        }
    }
}
