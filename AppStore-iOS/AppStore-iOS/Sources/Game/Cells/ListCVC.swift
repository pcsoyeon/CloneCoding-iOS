//
//  ListCVC.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/17.
//

import UIKit

class ListCVC: UICollectionViewCell {
    static let identifier = "ListCVC"
    
    // MARK: - Properties
    
    private lazy var listTableView = UITableView(frame: .zero, style: .plain)
    
    private var games = [Game]()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUI()
        setTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        listTableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}

extension ListCVC {
    func configUI() {
        addSubview(listTableView)
    }
    
    func setTableView() {
        listTableView.register(ListInTVC.self, forCellReuseIdentifier: ListInTVC.identifier)
        
        listTableView.delegate = self
        listTableView.dataSource = self
        
        listTableView.isScrollEnabled = false
    }
    
    func initCell(games: [Game]) {
        self.games = games
    }
}

extension ListCVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 3
    }
}

extension ListCVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListInTVC.identifier) as? ListInTVC else { return UITableViewCell() }
        cell.initCell(image: games[indexPath.row].image, title: games[indexPath.row].title, subTitle: games[indexPath.row].subTitle, free: games[indexPath.row].free, price: games[indexPath.row].price)
        return cell
    }
}
