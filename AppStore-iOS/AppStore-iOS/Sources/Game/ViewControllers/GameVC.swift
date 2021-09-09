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
    
    lazy var titleLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize, weight: .heavy)
        $0.text = "Games"
        $0.setContentHuggingPriority(.defaultLow, for: .horizontal)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
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
        
        getNotification()
    }
}

extension GameVC {
    func setLargeTitle() {
        self.title = "Games"
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
        gameTableView.register(IntroTVC.self, forCellReuseIdentifier: IntroTVC.identifier)
        
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
            return 320
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

extension GameVC {
    func getNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(pushToDetailVC(_:)), name: NSNotification.Name("PushToDetailVC"), object: nil)
    }
    
    @objc
    func pushToDetailVC(_ notification: Notification) {
        var cell: GameCVC
        cell = notification.object as! GameCVC
        
        let vc = DetailVC(cell: cell)
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
