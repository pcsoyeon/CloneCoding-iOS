//
//  TodayListViewModels.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/06.
//

import UIKit

class TodayListViewModel {
    let lists: [Today] = [
        Today(title: "ROBLOX가 날개를 달아줘요!", subTitle: "한정 기간 이벤트"),
        Today(title: "놓쳐선 안 될 재미", subTitle: "업데이트"),
    ]
    
    private var todayCollectionView: UICollectionView?
    
    init(collectionView: UICollectionView) {
        todayCollectionView = collectionView
        todayCollectionView?.reloadData()
    }
}
