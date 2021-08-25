//
//  TodayReusableView.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/05.
//

import UIKit

class TodayReusableView: UICollectionReusableView {
    static let identifier = "TodayReusableView"
    
    // MARK: - Properties
    
    private var dateLabel = UILabel().then {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "M월 d일 E요일"
        let currentDate = dateFormatter.string(from: Date())
        
        $0.text = currentDate
        $0.textColor = .gray
        $0.font = UIFont.systemFont(ofSize: 13)
    }
    
    private var todayLabel = UILabel().then {
        $0.text = "Today"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    private var iconImage = UIImageView().then {
        $0.image = UIImage(named: "userIcon")
    }
    
    // MARK: - Custom Methods
    
    func configUI() {
        addSubviews([dateLabel, todayLabel, iconImage])
    }
    
    override func layoutSubviews() {
        dateLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(20)
        }
        
        todayLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(20)
        }
        
        iconImage.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(20)
            make.width.height.equalTo(50)
        }
    }
}
