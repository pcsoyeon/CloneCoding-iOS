//
//  UITableView+.swift
//  AppStore-iOS
//
//  Created by soyeon on 2021/08/31.
//

import Foundation
import UIKit

public extension UITableView {
    func isLast(for indexPath: IndexPath) -> Bool {
        let indexOfLastSection = numberOfSections > 0 ? numberOfSections - 1 : 0
        let indexOfLastRowInLastSection = numberOfRows(inSection: indexOfLastSection) - 1
        
        return indexPath.section == indexOfLastSection && indexPath.row == indexOfLastRowInLastSection
    }
    
    func ut_registerNibCell<T>(_ cellType: T.Type) where T: UITableViewCell {
        let nib = UINib(nibName: "\(cellType)", bundle: nil)
        let identifier = "\(cellType)"
        register(nib, forCellReuseIdentifier: identifier)
    }
    
    func ut_registerClassCell<T>(_ cellType: T.Type) where T: UITableViewCell {
        let identifier = "\(cellType)"
        register(cellType, forCellReuseIdentifier: identifier)
    }
    
    func ut_dequeueReusable<T: UITableViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withIdentifier: "\(T.self)", for: indexPath) as! T
        return cell
    }
    
    func ut_registerNibHeaderFooterView<T>(_ viewType: T.Type) where T: UITableViewHeaderFooterView {
        let nib = UINib(nibName: "\(viewType)", bundle: nil)
        let identifier = "\(viewType)"
        register(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    func ut_registerClassHeaderFooterView<T>(_ viewType: T.Type) where T: UITableViewHeaderFooterView {
        let identifier = "\(viewType)"
        register(viewType, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    func ut_dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ view: T.Type) -> T {
        let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: "\(T.self)") as! T
        return headerFooterView
    }
}
