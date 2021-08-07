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
    
    private var gameCollection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())

    // MARK: - Life Cycle
    
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

extension GameTVC {
    func configUI() {
        backgroundColor = .white
    }
    
    func setConstraints() {
        contentView.addSubview(gameCollection)
        
        gameCollection.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func setCollectionView() {
        gameCollection.delegate = self
        gameCollection.dataSource = self
        
        gameCollection.register(GameCVC.self, forCellWithReuseIdentifier: GameCVC.identifier)
        
        gameCollection.backgroundColor = .white
    }
}

extension GameTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}

extension GameTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCVC.identifier, for: indexPath) as? GameCVC else { return UICollectionViewCell() }
        return cell
    }
}
