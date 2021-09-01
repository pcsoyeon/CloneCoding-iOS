//
//  SearchVC.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/17.
//

import UIKit

class SearchVC: UIViewController {
    
    // MARK: - Properties
    
    private var searchTableView = UITableView(frame: .zero, style: .grouped)
    private var searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - Local Variables
    
    private var newList = [New]()
    private var recommendList = [Game]()

    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        setConstraints()
        
        setList()
        setTableView()
    }
}

extension SearchVC {
    func configUI() {
        view.backgroundColor = .white
        
        self.title = "검색"
        navigationController?.navigationBar.backgroundColor = UIColor.white
        navigationController?.navigationBar.shadowImage = UIImage()
        
        searchController.searchBar.placeholder = "게임, 앱, 스토리 등"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).title = "취소"
    }
    
    func setConstraints() {
        view.addSubview(searchTableView)
        
        searchTableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setList() {
        newList.append(contentsOf: [
            New(title: "컬러링"),
            New(title: "투두리스트"),
            New(title: "카트라이더"),
            New(title: "samsara room")
        ])
        
        recommendList.append(contentsOf: [
            Game(category: "", title: "MARVEL 퓨처 레볼루션", subTitle: "A new future begins!", image: "abc", free: "무료", price: 0),
            Game(category: "", title: "eFootball PES 2021", subTitle: "본격 액션 축구 게임!", image: "abc", free: "유료", price: 20),
            Game(category: "", title: "1945 슈팅 게임:\n비행기 전쟁", subTitle: "아케이드 클래식 슈팅 비행기 세트 전쟁", image: "abc", free: "앱 내 구입", price: 30),
            Game(category: "", title: "쿠키런 for Kakao", subTitle: "어드벤처", image: "abc", free: "앱 내 구입", price: 40),
            Game(category: "", title: "꿈의 마을 (Township)", subTitle: "작은 마을을 대도시로 키워요", image: "abc", free: "앱 내 구입", price: 10),
            Game(category: "", title: "삼국지 전략판", subTitle: "코에이 테크모 검수 혁신대작", image: "abc", free: "앱 내 구입", price: 100),
        ])
    }
    
    func setTableView() {
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        searchTableView.register(NewTVC.self, forCellReuseIdentifier: NewTVC.identifier)
        searchTableView.register(ListInTVC.self, forCellReuseIdentifier: ListInTVC.identifier)
        
        searchTableView.backgroundColor = .white
        searchTableView.showsVerticalScrollIndicator = false
    }
}

extension SearchVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        } else {
            return 90
        }
    }
}

extension SearchVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return newList.count
        } else {
            return recommendList.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "새로운 발견"
        } else {
            return "추천 앱과 게임"
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .black
        let header = view as! UITableViewHeaderFooterView
        header.addBottomBorderWithColor(color: .white)
        header.textLabel?.textColor = .black
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NewTVC.identifier) as? NewTVC else {
                return UITableViewCell()
            }
            cell.initCell(title: newList[indexPath.row].title)
            cell.selectionStyle = .none
            return cell
        }
        
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ListInTVC.identifier) as? ListInTVC else {
                return UITableViewCell()
            }
            if indexPath.row == 0 {
                DispatchQueue.main.async {
                    cell.showHighligt(isHidden: false)
                }
            }
            cell.initCell(image: recommendList[indexPath.row].image, title: recommendList[indexPath.row].title, subTitle: recommendList[indexPath.row].subTitle, free: recommendList[indexPath.row].free, price: recommendList[indexPath.row].price)
            cell.selectionStyle = .none
            return cell
        }
        
        return UITableViewCell()
    }
}
