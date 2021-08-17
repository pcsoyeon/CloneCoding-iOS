//
//  IntroTVC.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/17.
//

import UIKit

class IntroTVC: UITableViewCell {
    static let identifier = "IntroTVC"
    
    // MARK: - Properties
    
    private lazy var headerView = ListHeaderView()
    
    private var listCollectionView: UICollectionView = {
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
        
        setHeaderView()
        setCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension IntroTVC {
    func configUI() {
        contentView.backgroundColor = .white
        contentView.addSubviews([headerView, listCollectionView])
        
        headerView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(100)
        }
        
        listCollectionView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setHeaderView() {
        headerView.titleLabel.text = "사전 주문 중"
        headerView.subTitleLabel.text = "출시 후 자동으로 다운로드됩니다"
    }
    
    func setCollectionView() {
        listCollectionView.register(IntroCVC.self, forCellWithReuseIdentifier: IntroCVC.identifier)
        
        listCollectionView.delegate = self
        listCollectionView.dataSource = self
        
        listCollectionView.backgroundColor = .white
        listCollectionView.contentInsetAdjustmentBehavior = .never
        listCollectionView.decelerationRate = .fast
    }
}

extension IntroTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.width - 40) / 2
        let cellHeight = collectionView.frame.height - 10
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 10, right: 20)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let spacing = (contentView.frame.width) / 2
        var offset = targetContentOffset.pointee
        let index = round((offset.x + scrollView.contentInset.left) / spacing)

        offset = CGPoint(x: index * spacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}

extension IntroTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IntroCVC.identifier, for: indexPath) as? IntroCVC else { return UICollectionViewCell() }
        return cell
    }
}
