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
}
