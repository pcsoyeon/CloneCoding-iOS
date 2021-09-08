//
//  TodayTVC.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/09/08.
//

import UIKit

class TodayTVC: UITableViewCell {
    static let identifier = "TodayTVC"
    
    // MARK: - Properties
    
    lazy var backView = UIView().then {
        $0.backgroundColor = .gray
        $0.layer.applyShadow()
        $0.layer.cornerRadius = 20
        $0.layer.masksToBounds = true
    }

    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension TodayTVC {
    func configUI() {
        backgroundColor = .white
    }
    
    func setConstraints() {
        addSubviews([backView])
        
        backView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview().inset(20)
        }
    }
}
