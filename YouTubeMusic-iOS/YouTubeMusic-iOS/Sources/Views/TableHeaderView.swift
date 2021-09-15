//
//  TableHeaderView.swift
//  YouTubeMusic-iOS
//
//  Created by soyeon on 2021/09/16.
//

import UIKit
import SnapKit

class TableHeaderView: UIView {
    
    // MARK: - Properties
    
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    
    // MARK: - Intializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configUI()
        setConstraints()
    }
    
    // MARK: - Custom Methods
    
    func configUI() {
        backgroundColor = .black
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        titleLabel.textColor = .white
        
        subTitleLabel.font = UIFont.systemFont(ofSize: 13)
        subTitleLabel.textColor = .systemGray5
    }
    
    func setConstraints() {
        addSubviews([titleLabel, subTitleLabel])
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.top).offset(-20)
            make.leading.equalTo(titleLabel.snp.leading)
        }
    }
}

extension TableHeaderView {
    func setTitle(title: String, subTitle: String) {
        titleLabel.text = title
        subTitleLabel.text = subTitle
    }
}
