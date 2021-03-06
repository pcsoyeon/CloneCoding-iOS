//
//  AppVC.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/17.
//

import UIKit

class AppVC: UIViewController {

    // MARK: - Properties
    
    private lazy var appTableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        setConstraints()
        
        setTableView()
    }
}

extension AppVC {
    func configUI() {
        view.backgroundColor = .white
        
        self.title = "Apps"
        navigationController?.navigationBar.backgroundColor = UIColor.white
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func setConstraints() {
        view.addSubviews([appTableView])
        
        appTableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func setTableView() {
        appTableView.delegate = self
        appTableView.dataSource = self
        
        appTableView.register(GameTVC.self, forCellReuseIdentifier: GameTVC.identifier)
        appTableView.register(ListTVC.self, forCellReuseIdentifier: ListTVC.identifier)
        appTableView.register(IntroTVC.self, forCellReuseIdentifier: IntroTVC.identifier)
        
        appTableView.backgroundColor = .white
        appTableView.separatorStyle = .none
    }
}

extension AppVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 336
        } else if indexPath.section == 1 {
            return 350
        } else if indexPath.section == 2 {
            return 320
        }
        return 0
    }
}

extension AppVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: GameTVC.identifier) as? GameTVC else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        }
        
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTVC.identifier) as? ListTVC else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        }
        
        if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IntroTVC.identifier) as? IntroTVC else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        }
        
        return UITableViewCell()
    }
}
