//
//  ListHeaderView.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/17.
//

import UIKit

class ListHeaderView: UIView {
    
    // MARK: - Properties
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "오늘은 이 게임"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 25)
    }
    
    private lazy var subTitleLabel = UILabel().then {
        $0.text  = "에디터가 직접 골랐답니다"
        $0.textColor = .gray
        $0.font = UIFont.systemFont(ofSize: 20)
    }
    
    private lazy var seeAllButton = UIButton().then {
        $0.setTitle("모두 보기", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
    }
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configUI()
    }
    
    private func configUI() {
        addSubviews([titleLabel, subTitleLabel,seeAllButton])
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(20)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(20)
        }
        
        seeAllButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(20)
        }
    }
}
