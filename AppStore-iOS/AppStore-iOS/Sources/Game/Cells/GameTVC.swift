//
//  GameTVC.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/06.
//

import UIKit

class GameTVC: UITableViewCell {
    static let identifier = "GameTVC"
    
    // MARK: - Properties
    
    private var gameCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Local Variables 
    
    private var games = [Game]()

    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
        setConstraints()
        
        setCollectionView()
        setList()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension GameTVC {
    func configUI() {
        backgroundColor = .white
    }
    
    func setConstraints() {
        contentView.addSubview(gameCollectionView)
        
        gameCollectionView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func setCollectionView() {
        gameCollectionView.delegate = self
        gameCollectionView.dataSource = self
        
        gameCollectionView.register(GameCVC.self, forCellWithReuseIdentifier: GameCVC.identifier)
        
        gameCollectionView.backgroundColor = .white
        gameCollectionView.contentInsetAdjustmentBehavior = .never
        gameCollectionView.decelerationRate = .fast
    }
    
    func setList() {
        games.append(contentsOf: [
            Game(category: "새 시즌에 뛰어드세요", title: "Candy Crush Saga", subTitle: "친구들과 함께 축하해요", image: "gameImage1", free: "무료", price: 10000),
            Game(category: "특별 이벤트", title: "8 Ball Pool", subTitle: "기네스북 등재 기념 특별 이벤트", image: "gameImage2", free: "무료", price: 10000),
            Game(category: "업데이트", title: "서머너즈 워: 천공의 아레나", subTitle: "새로운 몬스터의 등장!", image: "gameImage3", free: "무료", price: 10000)
        ])
    }
}

extension GameTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 40
        let height = collectionView.frame.height - 20
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let spacing = contentView.frame.width
        var offset = targetContentOffset.pointee
        let index = round((offset.x + scrollView.contentInset.left) / spacing)

        offset = CGPoint(x: index * spacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}

extension GameTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCVC.identifier, for: indexPath) as? GameCVC else { return UICollectionViewCell() }
        cell.initCell(category: games[indexPath.row].category, title: games[indexPath.row].title, subTitle: games[indexPath.row].subTitle, image: games[indexPath.row].image)
        return cell
    }
}
