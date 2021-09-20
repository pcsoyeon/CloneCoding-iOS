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
    
    // Set Custom Navigationbar
    private lazy var logoButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Music", style: .plain, target: self, action: #selector(touchUpCompletionButton(_:)))
        button.tintColor = .white
        return button
    }()
    
    private lazy var displayButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(touchUpCompletionButton(_:)))
        button.tintColor = .white
        button.setBackgroundImage(UIImage(systemName: "display"), for: .normal, barMetrics: UIBarMetrics.default)
        return button
    }()

    private lazy var searchButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(touchUpCompletionButton(_:)))
        button.tintColor = .white
        button.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal, barMetrics: UIBarMetrics.default)
        return button
    }()
    
    private lazy var userButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "User", style: .plain, target: self, action: #selector(touchUpCompletionButton(_:)))
        button.tintColor = .white
        return button
    }()

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        setConstraints()
        setNavigationBar()
        
        setTableView()
    }
}

extension HomeVC {
    func configUI() {
        view.backgroundColor = .black
    }
    
    func setNavigationBar() {
        // 네비게이션 바 구분선 투명하게
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationItem.setLeftBarButton(logoButton, animated: true)
        navigationItem.setRightBarButtonItems([userButton, searchButton, displayButton], animated: true)
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

// MARK: - Action Methods

extension HomeVC {
    @objc func touchUpCompletionButton(_ sender: UIBarButtonItem) {
        print("Button Clicked!!")
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
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
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
