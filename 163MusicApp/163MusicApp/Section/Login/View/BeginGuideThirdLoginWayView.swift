//
//  BeginGuideThirdLoginWayView.swift
//  163MusicApp
//
//  Created by 今晚月色真美 on 2019/9/4.
//  Copyright © 2019 今晚月色真美. All rights reserved.
//

import UIKit

class BeginGuideThirdLoginWayView: UIView {
    
    // MARK: Public
    /// 微信
    var weiChatButton: UIButton!
    /// QQ
    var qqButton: UIButton!
    /// 微博
    var weiboButton: UIButton!
    /// 网易邮箱
    var wangyiButton: UIButton!

    // MARK: Private
    private var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
        setupSubViewsLayouts()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Initialization Methods

private extension BeginGuideThirdLoginWayView {
    func setupSubViews() {
        weiChatButton = setupButton(with: "cm2_login_btn_weixin")
        qqButton = setupButton(with: "cm2_login_btn_qq")
        weiboButton = setupButton(with: "cm2_login_btn_sina")
        wangyiButton = setupButton(with: "cm2_login_btn_netease")

        stackView =  UIStackView.init(arrangedSubviews: [weiChatButton, qqButton, weiboButton, wangyiButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        addSubview(stackView)
    }
    
    func setupSubViewsLayouts() {
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func setupButton(with imageName: String) -> UIButton {
        let button = UIButton(type: .custom)
        let image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = .white
        return button
    }
}
