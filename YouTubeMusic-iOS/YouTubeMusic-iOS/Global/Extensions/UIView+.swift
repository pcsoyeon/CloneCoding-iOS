//
//  UIView+.swift
//  YouTubeMusic-iOS
//
//  Created by soyeon on 2021/09/16.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}
