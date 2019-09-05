//
//  BeginGuideController.swift
//  163MusicApp
//
//  Created by 今晚月色真美 on 2019/9/4.
//  Copyright © 2019 今晚月色真美. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BeginGuideController: BaseController {
    // MARK: Public
    
    // MARK: Private
    /// 第三方登陆
    let thridLoginWayView: BeginGuideThirdLoginWayView = BeginGuideThirdLoginWayView()
    /// 登陆方法
    let loginWayView: BeginGuideLoginWayView = BeginGuideLoginWayView()
    /// logoView
    let logoView: BeginGuideWaveAnimationView = BeginGuideWaveAnimationView()
    
    let disposeBag: DisposeBag = DisposeBag()

    
    // MARK: Deinit
    deinit {
        print("[\(type(of: self)) deinit]")
    }
    
    // MARK: Controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefaultData()
        setupSubViews()
        setupSubViewsLayouts()
        setuptTargetAction()
    }
}

// MARK: - Initialization Methods

private extension BeginGuideController {
        
    func setupDefaultData() {
        view.backgroundColor = kMAIN_COLOR_RED
        navigationView.isHidden = true
    }
    
    func setupSubViews() {
        view.addSubview(thridLoginWayView)
        view.addSubview(loginWayView)
        view.addSubview(logoView)
    }
    
    func setupSubViewsLayouts() {
        thridLoginWayView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            if #available(iOS 11.0, *) {
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            } else {
                make.bottom.equalTo(view.snp.bottom).offset(-20)
            }
            make.height.equalTo(100)
        }
        
        loginWayView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(thridLoginWayView.snp_top).offset(-10)
            make.height.equalTo(200)
        }
        
        logoView.snp.makeConstraints { (make) in
            make.leading.top.trailing.equalToSuperview()
            make.bottom.equalTo(loginWayView.snp_top)
        }
        logoView.startAnimation()
    }
}

// MARK: - Target action methos

@objc private extension BeginGuideController {
    func setuptTargetAction() {
        
        /// 同意协议点击事件
        loginWayView.agreeButton.rx.tap.subscribe(onNext: { [weak self] () in
            self?.loginWayView.agreeButton.isSelected = !(self?.loginWayView.agreeButton.isSelected)!
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        
        /// 手机号登陆点击事件
        loginWayView.mobileLoginButton.rx.tap.subscribe(onNext: { [weak self] () in
            if !(self?.loginWayView.agreeButton.isSelected)! {
                self?.loginWayView.protocolAnimaton()
            }
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        
        /// 立即体验点击事件
        loginWayView.experienceButton.rx.tap.subscribe(onNext: { [weak self] () in
            print("\(String(describing: self))")
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }
}

// MARK: - Network request methods

private extension BeginGuideController {
    
}

