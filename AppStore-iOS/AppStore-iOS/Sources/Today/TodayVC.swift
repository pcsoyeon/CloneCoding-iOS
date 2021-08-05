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
    
    private var todayTitles = [TitlesDataModel]()
    
    // MARK: - Life Cycle 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        setConstraints()
        
        setList()
        setCollectionView()
        
        setLongPressGesture()
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
    
    func setList() {
        todayTitles.append(contentsOf: [
            TitlesDataModel(title: "제2의 나라\n모험을 위한 팁4", subTitle: "지금 경험하세요"),
            TitlesDataModel(title: "꼭 해봐야 할 RPG", subTitle: "고르고 골랐어요"),
            TitlesDataModel(title: "길건너 친구들 캐슬\n전격 해부", subTitle: "APPLE ARCADE"),
            TitlesDataModel(title: "2020 도쿄올림픽\n앱으로 시청하세요", subTitle: "실시간으로 보세요")
        ])
    }
    
    
}

extension TodayVC: UIGestureRecognizerDelegate{
    func setLongPressGesture() {
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gestureRecognizer:)))
        gesture.minimumPressDuration = 0.5
        gesture.delegate = self
        gesture.delaysTouchesBegan = true
        todayCollectionView.addGestureRecognizer(gesture)
    }
    
    @objc func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer) {
        let point = gestureRecognizer.location(in: todayCollectionView)
        guard let indexPath = todayCollectionView.indexPathForItem(at: point) else { return }
        guard let cell = todayCollectionView.cellForItem(at: indexPath) else { return }
        
        switch gestureRecognizer.state {
        case UIGestureRecognizer.State.began:
            UIView.animate(withDuration: 0.25) {
                cell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }
        case UIGestureRecognizer.State.ended:
            let dvc = TodayDetailVC()
            dvc.modalPresentationStyle = .fullScreen
            self.present(dvc, animated: true) {
                cell.transform = .identity
            }
        default:
            gestureRecognizer.state = .ended
        }
        return
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("짧게 눌림")
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
        return todayTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayCVC.identifier, for: indexPath) as? TodayCVC else {
            return UICollectionViewCell()
        }
        cell.initCell(title: todayTitles[indexPath.row].title, subTitle: todayTitles[indexPath.row].subTitle)
        return cell
    }
}

