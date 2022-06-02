//
//  CollectionView+UI.swift
//  iCookPad
//
//  Created by Youssef Bhl on 02/06/2022.
//

import Foundation
import UIKit

extension UICollectionView {
    
    public func showLoadingSpinner() {
        let loadingAnimationView = SpinnerLoading()
        loadingAnimationView.showOnCollectionView(view: self)
    }
    
    public func dismiss() {
        let loadingAnimationView = SpinnerLoading()
        loadingAnimationView.dismiss()
    }
    
}
