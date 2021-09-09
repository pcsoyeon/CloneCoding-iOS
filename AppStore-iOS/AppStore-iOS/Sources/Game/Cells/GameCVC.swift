//
//  GameCVC.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/06.
//

import UIKit

class GameCVC: UICollectionViewCell {
    static let identifier = "GameCVC"
    
    // MARK: - Properties
    
    private var backView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private var lineView = UIView().then {
        $0.backgroundColor = .systemGray5
    }
    
    private var categoryLabel = UILabel().then {
        $0.textColor = .systemBlue
        $0.font = UIFont.systemFont(ofSize: 13)
    }
    
    var titleLabel = UILabel().then {
        $0.text = "Title"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    
    var subTitleLabel = UILabel().then {
        $0.text = "SubTitle"
        $0.textColor = .gray
        $0.font = UIFont.systemFont(ofSize: 15)
    }
    
    var appImageView = UIImageView().then {
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
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
        backView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview().inset(5)
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.width.equalToSuperview()
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().inset(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(categoryLabel.snp.bottom).offset(10)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        
        appImageView.snp.makeConstraints { make in
            make.width.centerX.bottom.equalToSuperview()
            make.top.equalTo(subTitleLabel.snp.bottom).offset(20)
        }
    }
}

extension GameCVC {
    func configUI() {
        contentView.addSubview(backView)
        
        backView.addSubviews([lineView, categoryLabel, titleLabel, subTitleLabel, appImageView])
    }
    
    func initCell(category: String, title: String, subTitle: String, image: String) {
        categoryLabel.text = category
        titleLabel.text = title
        subTitleLabel.text = subTitle
        
        appImageView.image = UIImage(named: image)
    }
}
