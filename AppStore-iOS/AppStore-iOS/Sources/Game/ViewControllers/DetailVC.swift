//
//  DetailVC.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/09/10.
//

import UIKit

class DetailVC: UIViewController {
    
    // MARK: - Properties
    
    private var appImageView = UIImageView().then {
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    
    // MARK: - Local Variables
    
    let cell: GameCVC!
    
    init(cell: GameCVC) {
        self.cell = cell
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
}

extension DetailVC {
    func configUI() {
        view.backgroundColor = .white
    }
}
