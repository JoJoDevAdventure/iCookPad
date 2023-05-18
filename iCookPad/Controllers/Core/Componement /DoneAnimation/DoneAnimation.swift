//
//  DoneAnimation.swift
//  iCookPad
//
//  Created by Youssef Bhl on 08/02/2023.
//

import Foundation
import UIKit
import Lottie

public class DoneAnimation: UIView {
    // MARK: - UI
    let doneDownloadAnimation = AnimationView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        doneDownloadAnimation.animation = Animation.named("done")
        doneDownloadAnimation.contentMode = .scaleAspectFit
        doneDownloadAnimation.loopMode = .playOnce
        doneDownloadAnimation.frame = frame
        doneDownloadAnimation.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func show() {
        addSubview(doneDownloadAnimation)
        doneDownloadAnimation.play {[weak self] _ in
            self?.doneDownloadAnimation.removeFromSuperview()
        }
    }
}
