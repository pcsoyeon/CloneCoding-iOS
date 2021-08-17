//
//  EventGame.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/06.
//

import Foundation

struct GameList {
    var games: [Game]
}

struct Game {
    var category: String
    var title: String
    var subTitle: String
    var image: String
    var free: String
    var price: Double
}

