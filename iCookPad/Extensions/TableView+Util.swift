//
//  TableView+.swift
//  iCookPad
//
//  Created by Youssef Bhl on 31/05/2022.
//

import Foundation
import UIKit

extension UITableView {

    private func reuseIndentifier<T>(for type: T.Type) -> String {
        return String(describing: type)
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(for type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: reuseIndentifier(for: type), for: indexPath) as? T else {
            fatalError("Failed to dequeue cell.")
        }
        return cell
    }
    
    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(for type: T.Type) -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: reuseIndentifier(for: type)) as? T else {
            fatalError("Failed to dequeue header/footer view.")
        }
        return view
    }
    
    public func registerCell<T: UITableViewCell>(_ type: T.Type) {
        register(type, forCellReuseIdentifier: reuseIndentifier(for: type))
    }
    
    public func registerHeaderFooterView<T: UITableViewHeaderFooterView>(_ type: T.Type) {
        register(type, forHeaderFooterViewReuseIdentifier: reuseIndentifier(for: type))
    }
    
    public func scrollToTop(animated: Bool = false) {
        let indexPathZero = IndexPath(row: 0, section: 0)
        scrollToRow(at: indexPathZero, at: .top, animated: animated)
    }
}
