//
//  DetailScrollView.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/09/08.
//

import UIKit

class DetailScrollView: UIScrollView {
    
    let bgBackView = UIView()
    let imageView = UIImageView()
    let textView = UITextView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        bgBackView.frame = CGRect(x: 0, y: 0, width: kScreenW, height: GlobalConstants.cardDetailTopImageH)
        bgBackView.layer.masksToBounds = true
        
        imageView.frame = bgBackView.bounds
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        
        bgBackView.addSubview(imageView)
        addSubview(bgBackView)
    }

}
