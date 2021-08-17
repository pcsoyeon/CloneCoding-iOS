//
//  GameViewModel.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/17.
//

import Foundation

struct GameListViewModel {
    var gameList: GameList
    
    init(_ gameList: GameList) {
        self.gameList = gameList
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.gameList.games.count
    }
    
    func gameAtIndex(_ index: Int) -> GameViewModel {
        let game = self.gameList.games[index]
        return GameViewModel(game)
    }
}

struct GameViewModel {
    var game: Game
    
    init(_ game: Game) {
        self.game = game
    }
    
    var title: String {
        return game.title
    }
    
    var subTitle: String {
        return game.subTitle
    }
}


