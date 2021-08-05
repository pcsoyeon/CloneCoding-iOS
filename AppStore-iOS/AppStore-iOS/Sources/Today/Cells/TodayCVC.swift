//
//  TodayCVC.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/05.
//

import UIKit

class TodayCVC: UICollectionViewCell {
    static let identifier = "TodayCVC"
    
    // MARK: - UI Components
    
    private var cardView = UIView().then {
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
    
    override func layoutSubviews() {
        cardView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview().inset(5)
        }
    }
    
    // MARK: - Custom Methods
    
    private func configUI() {
        contentView.addSubview(cardView)
    }
}
