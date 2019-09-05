//
//  BeginGuideLoginWayView.swift
//  163MusicApp
//
//  Created by 今晚月色真美 on 2019/9/4.
//  Copyright © 2019 今晚月色真美. All rights reserved.
//

import UIKit
import YYText

class BeginGuideLoginWayView: UIView {
    
    // MARK: Public
    /// 手机号登陆
    var mobileLoginButton: UIButton!
    /// 立即体验
    var experienceButton: UIButton!
    /// 服务条款
    var agreeButton: UIButton!
    /// 富文本
    let protocolAttributedText = NSMutableAttributedString(string: "同意《服务条款》和《隐私政策》")
    var protocolLabel: YYLabel!
    /// 可以抖动的视图
    var checkAnimationView: UIView!
    // MARK: Private
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
        setupSubViewsLayouts()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func protocolAnimaton() {
        UIView.animate(withDuration: 0.08, animations: {
            self.checkAnimationView.transform = CGAffineTransform(translationX: 5, y: 0)
        }) { (finished) in
            UIView.animate(withDuration: 0.08, animations: {
                self.checkAnimationView.transform = CGAffineTransform(translationX: -5, y: 0)
            }) { (finished) in
                  UIView.animate(withDuration: 0.08, animations: {
                      self.checkAnimationView.transform = CGAffineTransform(translationX: 5, y: 0)
                  }) { (finished) in
                    UIView.animate(withDuration: 0.08, animations: {
                        self.checkAnimationView.transform = CGAffineTransform(translationX: -5, y: 0)
                    }) { (finished) in
                        UIView.animate(withDuration: 0.08) {
                            self.checkAnimationView.transform = CGAffineTransform(translationX: 0, y: 0)
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Initialization Methods

private extension BeginGuideLoginWayView {
    func setupSubViews() {
        mobileLoginButton = UIButton(type: .custom)
        mobileLoginButton.setTitle("手机号登陆", for: .normal)
        mobileLoginButton.setTitleColor(kMAIN_COLOR_RED, for: .normal)
        mobileLoginButton.titleLabel?.font = .systemFont(ofSize: 15)
        mobileLoginButton.backgroundColor = .white
        mobileLoginButton.layer.cornerRadius = 20
        addSubview(mobileLoginButton)
        
        experienceButton = UIButton(type: .custom)
        experienceButton.setTitle("立即体验", for: .normal)
        experienceButton.setTitleColor(UIColor.white, for: .normal)
        experienceButton.titleLabel?.font = .systemFont(ofSize: 15)
        experienceButton.backgroundColor = .clear
        experienceButton.layer.borderColor = UIColor.white.cgColor
        experienceButton.layer.borderWidth = 1
        experienceButton.layer.cornerRadius = 20
        addSubview(experienceButton)
        
        checkAnimationView = UIView()
        checkAnimationView.backgroundColor = .clear
        addSubview(checkAnimationView)
        
        agreeButton = UIButton(type: .custom)
        agreeButton.setImage(UIImage(named: "cm6_login_unchecked_12x12_")?.withRenderingMode(.alwaysTemplate), for: .normal)
        agreeButton.setImage(UIImage(named: "cm6_login_checked_14x14_")?.withRenderingMode(.alwaysTemplate), for: .selected)
        agreeButton.imageView?.tintColor = .lightGray
        checkAnimationView.addSubview(agreeButton)
        
        protocolLabel = YYLabel()
        protocolLabel.font = .systemFont(ofSize: 12)
        protocolLabel.textAlignment = .left
        protocolAttributedText.yy_setColor(.lightGray, range: NSRange(location: 0, length: 2))
        protocolAttributedText.yy_setColor(.white, range: NSRange(location: 2, length: 6))
        protocolAttributedText.yy_setColor(.lightGray, range: NSRange(location: 8, length: 2))
        protocolAttributedText.yy_setColor(.white, range: NSRange(location: 9, length: 6))
        protocolAttributedText.yy_setTextHighlight(NSRange(location: 2, length: 6), color: .white, backgroundColor: nil) { (view, attStribg, _, _) in
            print("服务条款")
        }
        protocolAttributedText.yy_setTextHighlight(NSRange(location: 9, length: 6), color: .white, backgroundColor: nil) { (view, attStribg, _, _) in
            print("隐私政策")
        }
        protocolLabel.attributedText = protocolAttributedText
        checkAnimationView.addSubview(protocolLabel)
    }

    func setupSubViewsLayouts() {
        checkAnimationView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(45)
        }
        
        protocolLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(20 + 5)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        agreeButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(protocolLabel)
            make.trailing.equalTo(protocolLabel.snp_leading).offset(-5)
            make.width.height.equalTo(20)
        }
        
        experienceButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(checkAnimationView.snp_top).offset(-5)
            make.leading.trailing.equalToSuperview().inset(45)
            make.height.equalTo(45)
        }
        
        mobileLoginButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(experienceButton.snp_top).offset(-15)
            make.leading.trailing.equalToSuperview().inset(45)
            make.height.equalTo(45)
        }
    }
}
