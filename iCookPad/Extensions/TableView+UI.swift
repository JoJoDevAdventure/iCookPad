//
//  TableView+UI.swift
//  iCookPad
//
//  Created by Youssef Bhl on 02/06/2022.
//

import Foundation
import UIKit

extension UITableView {
    
    public func showLoadingSpinner() {
        let loadingAnimationView = SpinnerLoading()
        loadingAnimationView.showOnTableView(view: self)
    }
    
    public func dismiss() {
        let loadingAnimationView = SpinnerLoading()
        loadingAnimationView.dismiss()
    }
    
}
