//
//  TabBarController.swift
//  YouTubeMusic-iOS
//
//  Created by soyeon on 2021/09/16.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().barTintColor = .darkGray
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 5)
        
        let homeTab = HomeVC()
        homeTab.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house.fill"), selectedImage: UIImage(systemName: "house.fill"))
        
        let searchTab = SearchVC()
        searchTab.tabBarItem = UITabBarItem(title: "둘러보기", image: UIImage(systemName: "location"), selectedImage: UIImage(systemName: "location"))
        
        let storageTab = StorageVC()
        storageTab.tabBarItem = UITabBarItem(title: "보관함", image: UIImage(systemName: "square.and.arrow.down.on.square.fill"), selectedImage: UIImage(systemName: "square.and.arrow.down.on.square.fill"))
        
        let tabs =  [homeTab, searchTab, storageTab]
        
        let fontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 9)]
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes as [NSAttributedString.Key : Any], for: .normal)
        
        setViewControllers(tabs, animated: false)
        selectedViewController = homeTab
    }
}
