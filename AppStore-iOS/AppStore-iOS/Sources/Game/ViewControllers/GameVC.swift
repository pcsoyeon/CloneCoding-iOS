//
//  GameVC.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/06.
//

import UIKit
import SnapKit
import Then

class GameVC: UIViewController {
    
    // MARK: - Properties 
    
    private lazy var gameTableView = UITableView(frame: .zero, style: .plain)
    
    lazy var titleStackView: TitleStackView = {
        let titleStackView = TitleStackView(frame: CGRect(origin: .zero, size: CGSize(width: view.bounds.width, height: 44.0)))
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        return titleStackView
    }()
    
    lazy var tableHeaderView: UIView = {
        let tableHeaderView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: view.bounds.width, height: 44.0)))
        tableHeaderView.addSubview(titleStackView)
        titleStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.bottom.equalToSuperview()
        }
        return tableHeaderView
    }()
    
    
    // MARK: - Life Cycle Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setTitle()
        setLargeTitle()
        
        configUI()
        setConstraints()
        
        setTableView()
    }
}

extension GameVC {
    func setTitle() {
        title = nil
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = UIColor.white
        navigationController?.navigationBar.shadowImage = UIImage()
        gameTableView.tableHeaderView = tableHeaderView
    }
    
    func setLargeTitle() {
        self.title = "게임"
        navigationController?.navigationBar.backgroundColor = UIColor.white
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func configUI() {
        view.backgroundColor = .white
    }
    
    func setConstraints() {
        view.addSubview(gameTableView)
        
        gameTableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func setTableView() {
        gameTableView.delegate = self
        gameTableView.dataSource = self
        
        gameTableView.register(GameTVC.self, forCellReuseIdentifier: GameTVC.identifier)
        gameTableView.register(ListTVC.self, forCellReuseIdentifier: ListTVC.identifier)
        
        gameTableView.backgroundColor = .white
        gameTableView.separatorStyle = .none
    }
}

extension GameVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 336
        } else if indexPath.section == 1 {
            return 350
        } else if indexPath.section == 2 {
            return 312
        }
        return 0
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let maxTitlePoint = gameTableView.convert(CGPoint(x: titleStackView.titleLabel.bounds.minX, y: titleStackView.titleLabel.bounds.maxY), from: titleStackView.titleLabel)
//        title = scrollView.contentOffset.y > maxTitlePoint.y ? "Games" : nil
//    }
}

extension GameVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: GameTVC.identifier) as? GameTVC else { return UITableViewCell() }
            return cell
        }
        
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTVC.identifier) as? ListTVC else { return UITableViewCell() }
            return cell
        }
        
        return UITableViewCell()
    }
}
