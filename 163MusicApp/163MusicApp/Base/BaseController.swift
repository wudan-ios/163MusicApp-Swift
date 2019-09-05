//
//  BaseController.swift
//  163MusicApp
//
//  Created by 今晚月色真美 on 2019/9/4.
//  Copyright © 2019 今晚月色真美. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
    // MARK: Public
    var navigationView: UIView!
    var backButton: UIButton!
    var titleLabel: UILabel!
    // MARK: Private
    
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
    }
}

// MARK: - Initialization Methods

private extension BaseController {
    
    func setupDefaultData() {
        view.backgroundColor = .white
    }
    
    func setupSubViews() {
        navigationView = UIView()
        navigationView.backgroundColor = .white
        view.addSubview(navigationView)
        navigationView.snp.makeConstraints { (make) in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(kTOPSAFE_HEIGHT)
        }
        
        backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "cml_navigation_back_28x28_"), for: .normal)
        navigationView.addSubview(backButton)
        backButton.snp.makeConstraints({ (make) in
            make.leading.equalTo(10)
            make.centerY.equalTo(navigationView.snp_bottom).offset(-22)
        })
        
        titleLabel = UILabel.init()
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.textAlignment = .center
        navigationView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(navigationView.snp_bottom).offset(-22)
        })
    }
    
    func setupSubViewsLayouts() {
        
    }
}

// MARK: - Target action methos

@objc private extension BaseController {
    
}

// MARK: - Network request methods

private extension BaseController {
    
}

