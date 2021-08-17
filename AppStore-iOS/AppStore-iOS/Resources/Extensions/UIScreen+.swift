//
//  UIScreen.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/17.
//

import Foundation
import UIKit

extension UIScreen{
    public var hasNotch: Bool{
        let deviceRatio = UIScreen.main.bounds.width / UIScreen.main.bounds.height
        if deviceRatio > 0.5{
            return false
        } else {
            return true
        }
    }
}
