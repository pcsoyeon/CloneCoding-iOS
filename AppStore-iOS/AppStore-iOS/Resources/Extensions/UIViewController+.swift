//
//  UIViewController+.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/31.
//

import Foundation
import UIKit

extension UINavigationController {
    func setNavi() {
        // To change colour of tappable items.
        UINavigationBar.appearance().tintColor = .black

        // To control navigation bar's translucency.
        UINavigationBar.appearance().isTranslucent = true
        
        UINavigationBar.appearance().prefersLargeTitles = true
    }
}
