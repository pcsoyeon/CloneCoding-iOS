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

        let todayTab = TodayVC()
        todayTab.tabBarItem = UITabBarItem(title: "투데이", image: UIImage(named: "btnHomeMaintabNormal"), selectedImage: UIImage(named: "btnHomeMaintabPressed"))
        
        let tabs =  [todayTab]
        
        setViewControllers(tabs, animated: false)
        selectedViewController = todayTab
    }
}
