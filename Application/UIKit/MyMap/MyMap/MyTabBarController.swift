//
//  MyTabBarController.swift
//  MyMap
//
//  Created by Thao Nguyen on 11/29/20.
//

import UIKit

class MyTabBarController: UITabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override var childForStatusBarStyle: UIViewController?{
        return nil
    }
}
