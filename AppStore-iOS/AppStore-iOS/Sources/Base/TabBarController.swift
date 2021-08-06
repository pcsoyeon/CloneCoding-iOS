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
        
        let tabs =  [todayTab, gameTab]
        
        setViewControllers(tabs, animated: false)
        selectedViewController = todayTab
    }
}
