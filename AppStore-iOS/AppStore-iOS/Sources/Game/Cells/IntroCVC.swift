//
//  IntroCVC.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/17.
//

import UIKit

class IntroCVC: UICollectionViewCell {
    static let identifier = "IntroCVC"
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension IntroCVC {
    func configUI() {
        backgroundColor = .gray
    }
}
