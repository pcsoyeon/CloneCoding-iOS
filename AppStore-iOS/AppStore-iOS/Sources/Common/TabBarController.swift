//
//  TabBarController.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/06.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().tintColor = .systemBlue
        
        let todayTab = TodayVC()
        todayTab.tabBarItem = UITabBarItem(title: "투데이", image: UIImage(named: "today"), selectedImage: UIImage(named: "today"))
        
        let gameTab = UINavigationController(rootViewController: GameVC())
        gameTab.setNavi()
        gameTab.tabBarItem = UITabBarItem(title: "게임", image: UIImage(named: "games"), selectedImage: UIImage(named: "games"))
        
        let appTab = UINavigationController(rootViewController: AppVC())
        appTab.setNavi()
        appTab.tabBarItem = UITabBarItem(title: "앱", image: UIImage(named: "apps"), selectedImage: UIImage(named: "apps"))
        
        let arcadeTab = UINavigationController(rootViewController: ArcadeVC())
        arcadeTab.setNavi()
        arcadeTab.tabBarItem = UITabBarItem(title: "Arcade", image: UIImage(named: "updates"), selectedImage: UIImage(named: "updates"))
        
        let searchTab = UINavigationController(rootViewController: SearchVC())
        searchTab.setNavi()
        searchTab.tabBarItem = UITabBarItem(title: "검색", image: UIImage(named: "search"), selectedImage: UIImage(named: "search"))
        
        let tabs =  [todayTab, gameTab, appTab, arcadeTab, searchTab]
        
        setViewControllers(tabs, animated: false)
        selectedViewController = todayTab
    }
}
