//
//  CollectionView+.swift
//  iCookPad
//
//  Created by Youssef Bhl on 31/05/2022.
//

import Foundation
import UIKit

extension UICollectionView {
    
    private func reuseIndentifier<T>(for type: T.Type) -> String {
        return String(describing: type)
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(for type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: reuseIndentifier(for: type), for: indexPath) as? T else {
            fatalError("Failed to dequeue cell.")
        }
        return cell
    }
    
    public func registerCell<T: UICollectionViewCell>(_ type: T.Type) {
        register(type, forCellWithReuseIdentifier: reuseIndentifier(for: type))
    }
}

