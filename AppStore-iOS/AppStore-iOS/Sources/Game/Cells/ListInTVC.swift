//
//  ListInTVC.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/17.
//

import UIKit

class ListInTVC: UITableViewCell {
    static let identifier = "ListInTVC"
    
    // MARK: - Properties
    
    private lazy var appImageView = UIView().then {
        $0.backgroundColor = .systemBlue
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
    
    private lazy var priceLabel = UILabel().then {
        $0.text = "앱 내 구입"
        $0.textColor = .gray
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.isHidden = true
    }
    
    private lazy var highligtView = UIView().then {
        $0.backgroundColor = .init(red: 80 / 255, green: 188 / 255, blue: 223 / 255, alpha: 0.1)
        $0.layer.cornerRadius = 15
        $0.layer.masksToBounds = true
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray5.cgColor
        $0.isHidden = true
    }

    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
    }
}

extension ListInTVC {
    func configUI() {
        contentView.addSubviews([highligtView, appImageView, titleLabel, subTitleLabel, getButton, priceLabel])
        
        appImageView.snp.makeConstraints { make in
            make.leading.centerY.equalToSuperview()
            make.width.height.equalTo(60)
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
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(80)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(getButton.snp.bottom).offset(5)
            make.centerX.equalTo(getButton)
        }
        
        highligtView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(-5)
            make.trailing.equalToSuperview().offset(5)
            make.top.bottom.equalToSuperview().inset(5)
        }
    }
    
    func initCell(image: String, title: String, subTitle: String, free: String, price: Double) {
        titleLabel.text = title
        subTitleLabel.text = subTitle
        
        if free.contains("유료") {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            getButton.setTitle("$\(formatter.string(from: NSNumber(value: price))!)", for: .normal)
        }
        
        if free.contains("앱 내 구입") {
            getButton.setTitle("받기", for: .normal)
            priceLabel.isHidden = false
        }
    }
    
    func showHighligt(isHidden: Bool) {
        highligtView.isHidden = isHidden
    }
}
