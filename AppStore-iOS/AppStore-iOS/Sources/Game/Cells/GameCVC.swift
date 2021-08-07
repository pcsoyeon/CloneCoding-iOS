//
//  GameCVC.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/06.
//

import UIKit

class GameCVC: UICollectionViewCell {
    static let identifier = "GameCVC"
    
    private var backView = UIView().then {
        $0.backgroundColor = .white
        
        $0.layer.cornerRadius = 15
        $0.layer.masksToBounds = true
        $0.layer.applyShadow()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        backView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview().inset(5)
        }
    }
}

extension GameCVC {
    func configUI() {
        contentView.addSubview(backView)
    }
}
