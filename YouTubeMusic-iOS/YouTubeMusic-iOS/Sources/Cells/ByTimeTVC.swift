//
//  ByTimeTVC.swift
//  YouTubeMusic-iOS
//
//  Created by soyeon on 2021/09/16.
//

import UIKit

class ByTimeTVC: UITableViewCell {
    static let identifier = "ByTimeTVC"
    
    // MARK: - Properties
    
    private var byTimeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configUI()
        setConstraints()
        setCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension ByTimeTVC {
    func configUI() {
        contentView.backgroundColor = .black
    }
    
    func setConstraints() {
        contentView.addSubviews([byTimeCollectionView])
        
        byTimeCollectionView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setCollectionView() {
        byTimeCollectionView.register(ByTimeCVC.self, forCellWithReuseIdentifier: ByTimeCVC.identifier)
        
        byTimeCollectionView.delegate = self
        byTimeCollectionView.dataSource = self
    }
}

extension ByTimeTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 20) / 3
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}

extension ByTimeTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ByTimeCVC.identifier, for: indexPath) as? ByTimeCVC else { return UICollectionViewCell() }
        return cell
    }
}
