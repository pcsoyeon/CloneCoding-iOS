//
//  GameCVC.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/06.
//

import UIKit

class GameCVC: UICollectionViewCell {
    static let identifier = "GameCVC"
    
    // MARK: UI Components
    
    private var backView = UIView().then {
        $0.backgroundColor = .white
        
        $0.layer.cornerRadius = 15
        $0.layer.masksToBounds = true
        $0.layer.applyShadow()
    }
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension GameCVC {
    func configUI() {
        addSubview(backView)
        
        backView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}
