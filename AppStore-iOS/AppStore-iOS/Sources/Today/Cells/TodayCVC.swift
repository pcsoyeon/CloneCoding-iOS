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
    
    private var backView = UIView().then {
        $0.backgroundColor = .white
        
        $0.layer.cornerRadius = 15
        $0.layer.masksToBounds = true
        $0.layer.applyShadow()
    }
    
    private var titleLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 25)
        
        $0.numberOfLines = 2
    }
    
    private var subTitleLabel = UILabel().then {
        $0.textColor = .gray
        $0.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    private var imageView = UIImageView().then {
        $0.image = UIImage(named: "game")
        $0.contentMode = .scaleAspectFill
        
        $0.layer.cornerRadius = 15
        $0.layer.masksToBounds = true
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
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
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(backView)
            make.bottom.equalTo(backView).inset(60)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(backView).inset(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(10)
            make.leading.equalTo(backView).inset(20)
        }
    }
    
    // MARK: - Custom Methods
    
    private func configUI() {
        contentView.addSubview(backView)
        
        backView.addSubviews([imageView, subTitleLabel, titleLabel])
    }
    
    func initCell(title: String, subTitle: String) {
        titleLabel.text = title
        
        subTitleLabel.text = subTitle
    }
}
