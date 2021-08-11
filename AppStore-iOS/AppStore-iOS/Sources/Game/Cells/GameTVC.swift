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
        
        return collectionView
    }()
    
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
    }
    
    func setList() {
        games.append(contentsOf: [
            Game(category: "카테고리", title: "이름", subTitle: "부제목", image: "gameImage1"),
            Game(category: "카테고리", title: "이름", subTitle: "부제목", image: "gameImage2"),
            Game(category: "카테고리", title: "이름", subTitle: "부제목", image: "gameImage3")
        ])
    }
}

extension GameTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 40)
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
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
