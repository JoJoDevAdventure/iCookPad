//
//  CollectionView+UI.swift
//  iCookPad
//
//  Created by Youssef Bhl on 02/06/2022.
//

import Foundation
import UIKit

extension UICollectionView {
    
    public func showLoadingSpinner(show: Bool) {
        let loadingAnimationView = SpinnerLoading()
        if show {
            loadingAnimationView.showOnCollectionView(view: self)
        } else {
            for aview in self.subviews {
                aview.removeFromSuperview()
            }
        }
    }
    
}
