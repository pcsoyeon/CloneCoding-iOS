//
//  GameVC.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/06.
//

import UIKit

class GameVC: UIViewController {
    
    // MARK: - UI Components
    
    private lazy var gameTableView = UITableView(frame: .zero, style: .plain)

    // MARK: - Life Cycle Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLargeTitle()
        configUI()
        setConstraints()
        
        setTableView()
    }
}

extension GameVC {
    func setLargeTitle() {
        self.title = "게임"
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
        
        gameTableView.backgroundColor = .white
    }
}

extension GameVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 336
        } else if indexPath.section == 1 {
            return 282
        } else if indexPath.section == 2 {
            return 312
        }
        return 0
    }
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
        return UITableViewCell()
    }
}
