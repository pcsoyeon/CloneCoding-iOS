//
//  ByTimeCVC.swift
//  YouTubeMusic-iOS
//
//  Created by soyeon on 2021/09/16.
//

import UIKit

class ByTimeCVC: UICollectionViewCell {
    static let identifier = "ByTimeCVC"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ByTimeCVC {
    func configUI() {
        backgroundColor = .white
    }
    
    func setConstraints() {
        
    }
}
