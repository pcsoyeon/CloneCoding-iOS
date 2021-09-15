//
//  ViewController.swift
//  YouTubeMusic-iOS
//
//  Created by soyeon on 2021/09/14.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: - Properties
    
    private lazy var homeTableView = UITableView(frame: .zero, style: .grouped)

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        setConstraints()
        setTableView()
    }
}

extension HomeVC {
    func configUI() {
        view.backgroundColor = .black
        
        title = "Music"
    }
    
    func setConstraints() {
        view.addSubviews([homeTableView])
        
        homeTableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setTableView() {
        homeTableView.register(ByTimeTVC.self, forCellReuseIdentifier: ByTimeTVC.identifier)
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        homeTableView.tableFooterView?.isHidden = true
    }
}

// MARK: - UITableView Delegate

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150
        case 1:
            return 150
        case 2:
            return 150
        case 3:
            return 150
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TableHeaderView()
        
        if section == 0 {
            headerView.titleLabel.text = "심야에 어울리는 음악"
            headerView.subTitleLabel.text = "다시 듣기"
        }
        
        if section == 1 {
            headerView.titleLabel.text = "즐겨 듣는 음악"
        }
        
        if section == 2 {
            headerView.titleLabel.text = "맞춤 믹스"
        }
        
        if section == 3 {
            headerView.titleLabel.text = "빠른 선곡"
            headerView.subTitleLabel.text = "이 노래로 뮤직 스테이션 시작하기"
        }
        
        return headerView
    }
}

// MARK: - UITableView DataSource

extension HomeVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ByTimeTVC.identifier) as? ByTimeTVC else { return UITableViewCell() }
            return cell
        }
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ByTimeTVC.identifier) as? ByTimeTVC else { return UITableViewCell() }
            return cell
        }
        return UITableViewCell()
    }
}
