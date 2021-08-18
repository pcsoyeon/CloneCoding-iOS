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
    
    //    private var appImageView = UIImageView().then {
    //        $0.layer.cornerRadius = 10
    //        $0.layer.masksToBounds = true
    //    }
    
    private var appImageView = UIView().then {
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    private var titleLabel = UILabel().then {
        $0.text = "Title"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    
    private var subTitleLabel = UILabel().then {
        $0.text = "subTitle"
        $0.textColor = .gray
        $0.font = UIFont.systemFont(ofSize: 15)
    }
    
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
        contentView.addSubviews([appImageView, titleLabel, subTitleLabel])
        
        appImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.height.equalTo(150)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(appImageView.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(10)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(10)
        }
    }
}
