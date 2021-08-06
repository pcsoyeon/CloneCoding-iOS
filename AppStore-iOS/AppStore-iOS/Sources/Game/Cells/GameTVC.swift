//
//  EventGameTVC.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/06.
//

import UIKit

class GameTVC: UITableViewCell {
    static let identifier = "GameTVC"
    
    // MARK: - Lazy Propertise
    
    private lazy var gameCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return collection
    }()
    
    // MARK: - Local Variables
    
    private var games = [Game]()
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setList()
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

extension GameTVC {
    func configUI() {
        
    }
    
    func setConstraints() {
        addSubview(gameCollectionView)
        
        gameCollectionView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func setList() {
        games.append(contentsOf: [
            Game(category: "특별 이벤트", title: "Roblox", subTitle: "한정 메카 윙을 가질 기회", image: "gameImage1"),
            Game(category: "특별 이벤트", title: "Roblox", subTitle: "한정 메카 윙을 가질 기회", image: "gameImage1"),
            Game(category: "특별 이벤트", title: "Roblox", subTitle: "한정 메카 윙을 가질 기회", image: "gameImage1")
        ])
    }
    
    func setCollectionView() {
        gameCollectionView.delegate = self
        gameCollectionView.dataSource = self
        
        gameCollectionView.isScrollEnabled = true
        gameCollectionView.register(GameCVC.self, forCellWithReuseIdentifier: GameCVC.identifier)
    }
}

extension GameTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 20 ) / 3
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 20, bottom: 20, right: 20)
    }
}

extension GameTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCVC.identifier, for: indexPath) as? GameCVC else { return UICollectionViewCell() }
        return cell
    }
}


