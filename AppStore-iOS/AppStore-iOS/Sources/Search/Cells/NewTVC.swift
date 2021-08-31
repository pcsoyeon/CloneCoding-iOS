//
//  NewTVC.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/31.
//

import UIKit

class NewTVC: UITableViewCell {
    static let identifier = "NewTVC"
    
    // MARK: Properties
    
    private var titleLabel = UILabel().then {
        $0.text = "title"
        $0.textColor = .systemBlue
        $0.font = UIFont.systemFont(ofSize: 18)
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

extension NewTVC {
    func configUI() {
        addSubview(titleLabel)
    }
    
    func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
    }
    
    func initCell(title: String) {
        titleLabel.text = title
    }
}
