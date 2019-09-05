//
//  Constant.swift
//  163MusicApp
//
//  Created by 今晚月色真美 on 2019/9/4.
//  Copyright © 2019 今晚月色真美. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import YYText

/// 主题颜色 -- 红
let kMAIN_COLOR_RED: UIColor = UIColor(red: 236 / 255.0, green: 64 / 255.0, blue: 60 / 255.0, alpha: 1)

/// 是否是刘海屏系列
var kIS_IPhoneX: Bool {
    var iPhoneX = false
    if UIDevice.current.userInterfaceIdiom != .phone {
        return iPhoneX
    }
    if #available(iOS 11.0, *) {
        if let mainWindow = UIApplication.shared.delegate?.window {
            if (mainWindow?.safeAreaInsets.bottom)! > CGFloat(0.0) {
                iPhoneX = true
            }
        }
    }
    return iPhoneX
}

/// 屏幕高度
let kSCREEN_WIDTH: CGFloat = UIScreen.main.bounds.width
/// 屏幕宽度
let kSCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.height
/// 状态栏高度
let kSTATUSBAR_HEIGHT: CGFloat = UIApplication.shared.statusBarFrame.height
/// 导航栏高度
let kNAVIGATIONBAR_HEIGHT: CGFloat = 44.0
/// 顶部区域
let kTOPSAFE_HEIGHT: CGFloat = kIS_IPhoneX ? (kSTATUSBAR_HEIGHT + kNAVIGATIONBAR_HEIGHT) : 64
