//
//  AlertView.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/09/10.
//

import UIKit
import SnapKit
import Then

class AlertView: UIView {
    
    // MARK: - Properties
    
    private lazy var appImageView = UIImageView().then {
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "Title"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.numberOfLines = 2
    }
    
    private lazy var subTitleLabel = UILabel().then {
        $0.text = "Subtitle"
        $0.textColor = .gray
        $0.font = UIFont.systemFont(ofSize: 13)
    }
    
    private lazy var getButton = UIButton().then {
        $0.setTitle("받기", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.backgroundColor = .systemGray5
        $0.layer.cornerRadius = 15
        $0.layer.masksToBounds = true
    }
    
    // MARK: - Initializers
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configUI()
    }
}

extension AlertView {
    func configUI() {
        backgroundColor = UIColor(red: 192 / 255, green: 192 / 255, blue: 192 / 255, alpha: 0.8)
        
        self.addSubviews([appImageView, titleLabel, subTitleLabel, getButton])
        
        appImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.width.height.equalTo(50)
            make.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.leading.equalTo(appImageView.snp.trailing).offset(10)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(appImageView.snp.trailing).offset(10)
        }
        
        getButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
            make.width.equalTo(80)
        }
    }
    
    func setImage(image: UIImage) {
        appImageView.image = image
        appImageView.contentMode = .scaleAspectFill
    }
}
