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
    
    private lazy var gameImageView = UIView().then {
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "Title"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    private lazy var subTitleLabel = UILabel().then {
        $0.text = "Subtitle"
        $0.textColor = .gray
        $0.font = UIFont.systemFont(ofSize: 13)
    }
    
    private lazy var getButton = UIButton().then {
        $0.setTitle("GET", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.backgroundColor = .systemGray5
        $0.layer.cornerRadius = 15
        $0.layer.masksToBounds = true
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
}

extension ListInTVC {
    func configUI() {
        contentView.addSubviews([gameImageView, titleLabel, subTitleLabel, getButton])
        
        gameImageView.snp.makeConstraints { make in
            make.leading.centerY.equalToSuperview()
            make.width.height.equalTo(60)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalTo(gameImageView.snp.trailing).offset(10)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(gameImageView.snp.trailing).offset(10)
        }
        
        getButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(80)
        }
    }
    
    func initCell(image: String, title: String, subTitle: String) {
        titleLabel.text = title
        subTitleLabel.text = subTitle
    }
}
