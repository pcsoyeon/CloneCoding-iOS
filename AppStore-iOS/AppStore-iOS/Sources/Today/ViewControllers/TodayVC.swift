//
//  TodayVC.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/25.
//

import UIKit
import SnapKit
import Then

class TodayVC: UIViewController {
    
    // MARK: - Properties
    
    private lazy var headerView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.text = "투데이"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    private lazy var dateLabel = UILabel().then {
        $0.text = "9월 8일 수요일"
        $0.textColor = .gray
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
    private lazy var userImageView = UIImageView().then {
        $0.image = UIImage(named: "userIcon")
    }
    
    private lazy var todayTableView = UITableView(frame: .zero, style: .grouped)
    
    // MARK: - Local Variables
    
    var selectedCell: TodayTVC?
    private var list = [String]()
    
    // MARK: - Status Bar
    
    var statusBarShouldBeHidden = false
    
    override var prefersStatusBarHidden: Bool {
        return statusBarShouldBeHidden
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    private func updateStatusBarAndTabbarFrame(visible: Bool) {
        statusBarShouldBeHidden = !visible
        UIView.animate(withDuration: 0.25) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        setConstraints()
        
        setList()
        setTableView()
    }
}

extension TodayVC {
    func configUI() {
        view.backgroundColor = .white
    }
    
    func setConstraints() {
        view.addSubviews([todayTableView])
        headerView.addSubviews([dateLabel, titleLabel, userImageView])
        
        dateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(dateLabel.snp.bottom).offset(5)
        }
        
        userImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalTo(titleLabel)
            make.width.height.equalTo(40)
        }
        
        todayTableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func setList() {
        list.append("gameImage1")
        list.append("gameImage2")
        list.append("gameImage3")
    }
    
    func setTableView() {
        todayTableView.delegate = self
        todayTableView.dataSource = self
        
        todayTableView.register(TodayTVC.self, forCellReuseIdentifier: TodayTVC.identifier)
        
        todayTableView.separatorStyle = .none
        todayTableView.backgroundColor = .white
    }
}

// MARK: - UITableView Delegate

extension TodayVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        guard let row = tableView.cellForRow(at: indexPath) as? TodayTVC else { return }
        UIView.animate(withDuration: 0.1) {
            row.backView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        guard let row = tableView.cellForRow(at: indexPath) as? TodayTVC else { return }
        UIView.animate(withDuration: 0.3) {
            row.backView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? TodayTVC else { return }
        selectedCell = cell
        
        let detailVC = CardDetailVC(cell: cell)
        detailVC.dismissClosure = { [weak self] in
            guard let StrongSelf = self else { return }
            StrongSelf.updateStatusBarAndTabbarFrame(visible: true)
        }
        updateStatusBarAndTabbarFrame(visible: false)
        
        present(detailVC, animated: true, completion: nil)
    }
}

// MARK: - UITableView DataSource

extension TodayVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodayTVC.identifier) as? TodayTVC else {
            return UITableViewCell()
        }
        cell.setImageView(image: list[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}
