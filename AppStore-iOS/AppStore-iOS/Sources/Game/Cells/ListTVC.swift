//
//  TodayGameTVC.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/17.
//

import UIKit

class ListTVC: UITableViewCell {
    static let identifier = "ListTVC"
    
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
    
    private var games1 = [Game]()
    private var games2 = [Game]()
    private var gameList = [[Game]]()
    
    private var gameListVM: GameListViewModel!

    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configUI()
        
        setList()
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

extension ListTVC {
    func configUI() {
        backgroundColor = .white
        
        contentView.addSubviews([headerView, listCollectionView])
        
        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
        
        listCollectionView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setList() {
        games1.append(contentsOf: [
            Game(category: "", title: "Pokemon GO", subTitle: "전 세계에서 포켓몬을 발견하자", image: "userIcon", free: "앱 내 구입", price: 0),
            Game(category: "", title: "Pokemon GO", subTitle: "전 세계에서 포켓몬을 발견하자", image: "userIcon", free: "앱 내 구입", price: 0),
            Game(category: "", title: "Pokemon GO", subTitle: "전 세계에서 포켓몬을 발견하자", image: "userIcon", free: "앱 내 구입", price: 0)
        ])
        
        games2.append(contentsOf: [
            Game(category: "", title: "ROBLOX", subTitle: "액션", image: "userIcon", free: "유료", price: 180),
            Game(category: "", title: "ROBLOX", subTitle: "액션", image: "userIcon", free: "유료", price: 150),
            Game(category: "", title: "ROBLOX", subTitle: "액션", image: "userIcon", free: "유료", price: 220)
        ])
        
        gameList.append(games1)
        gameList.append(games2)
    }
    
    func setHeaderView() {
        headerView.titleLabel.text = "오늘은 이 게임"
        headerView.subTitleLabel.text = "에디터가 직접 골랐답니다"
    }
    
    func setCollectionView() {
        listCollectionView.register(ListCVC.self, forCellWithReuseIdentifier: ListCVC.identifier)
        
        listCollectionView.delegate = self
        listCollectionView.dataSource = self
        
        listCollectionView.backgroundColor = .white
        listCollectionView.contentInsetAdjustmentBehavior = .never
        listCollectionView.decelerationRate = .fast
    }
}

extension ListTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width - 30
        let cellHeight = collectionView.frame.height
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let spacing = contentView.frame.width
        var offset = targetContentOffset.pointee
        let index = round((offset.x + scrollView.contentInset.left) / spacing)

        offset = CGPoint(x: index * spacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}

extension ListTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCVC.identifier, for: indexPath) as? ListCVC else { return UICollectionViewCell() }
        cell.initCell(games: gameList[indexPath.row])
        return cell
    }
}
