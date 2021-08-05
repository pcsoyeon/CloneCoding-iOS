//
//  ViewController.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/04.
//

import UIKit
import SnapKit
import Then

class TodayVC: UIViewController {
    
    // MARK: - Properties
    
    let collectionViewFlowLayout = UICollectionViewFlowLayout()
    
    
    // MARK: - Lazy Properties
    
    private lazy var todayCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
    
    
    // MARK: - Local Variables
    
    
    // MARK: - Life Cycle 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        setConstraints()
        
        setCollectionView()
    }
}

// MARK: - Custom Methods

extension TodayVC {
    func configUI() {
        view.backgroundColor = .white
    }
    
    func setConstraints() {
        view.addSubview(todayCollectionView)
        
        todayCollectionView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func setCollectionView() {
        todayCollectionView.delegate = self
        todayCollectionView.dataSource = self
        
        todayCollectionView.register(TodayReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TodayReusableView.identifier)
        todayCollectionView.register(TodayCVC.self, forCellWithReuseIdentifier: TodayCVC.identifier)
        
        todayCollectionView.backgroundColor = .white
    }
}

// MARK: - UICollectionView Delegate

extension TodayVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 40
        let height = (collectionView.frame.height - 60 - 20) / 2
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}

extension TodayVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TodayReusableView.identifier, for: indexPath) as? TodayReusableView else {
            return UICollectionReusableView()
        }
        view.configUI()
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayCVC.identifier, for: indexPath) as? TodayCVC else {
            return UICollectionViewCell()
        }
        return cell
    }
}

