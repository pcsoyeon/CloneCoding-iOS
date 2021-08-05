//
//  UIView+.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/05.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}
