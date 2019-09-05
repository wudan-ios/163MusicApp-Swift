//
//  BeginGuideWaveAnimationView.swift
//  163MusicApp
//
//  Created by 今晚月色真美 on 2019/9/4.
//  Copyright © 2019 今晚月色真美. All rights reserved.
//

import UIKit

class BeginGuideWaveAnimationView: UIView {
    
    var logoImageView: UIImageView!
    var timer: Timer?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
//        //最初半径
//        let radius = self.frame.size.width * 0.5;
//        //开始角
//        let startAngle: CGFloat = 0;
//        //结束角
//        let endAngle: CGFloat = CGFloat(2 * Double.pi);
//        //中心点
//        let center = CGPoint(x: rect.width * 0.25, y: rect.height * 0.25)
//        //画圆
//        let bezierPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
//        //生成layer对象
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = bezierPath.cgPath//设置path
//        shapeLayer.strokeColor = UIColor.lightGray.cgColor//圆边框颜色
//        shapeLayer.fillColor = UIColor .clear.cgColor//圆填充颜色
//        self.layer.addSublayer(shapeLayer)
    }
    
    func startAnimation() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timrAction(timer:)), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: .common)
    }
    
    @objc func timrAction(timer: Timer) {

//        UIView.animate(withDuration: 2, animations: {
//            self.transform = CGAffineTransform(scaleX: 2, y: 2)
//            self.alpha = 0
//        }) { (finished) in
//
//        }
    }
    
    func stopAnimaton() {
        if let t = timer {
            t.invalidate()
        }
        timer = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "cm2_watch_logo_42")
        addSubview(logoImageView)
        logoImageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.width.equalTo(60)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
