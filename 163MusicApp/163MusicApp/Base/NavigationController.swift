//
//  NavigationController.swift
//  163MusicApp
//
//  Created by 今晚月色真美 on 2019/9/4.
//  Copyright © 2019 今晚月色真美. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    // MARK: Controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
