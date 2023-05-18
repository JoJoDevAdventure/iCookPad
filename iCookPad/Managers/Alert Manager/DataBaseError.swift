//
//  DataBaseErrrors.swift
//  iCookPad
//
//  Created by Youssef Bhl on 17/05/2023.
//

import Foundation

public enum DBError: Error {
    case invalidAppDelegate
    case invalidImageURL
    case invalidImageData
    case failedToSaveImage
    case failedToSaveData
    
    var localizedDescription: String {
        switch self {
        case .invalidAppDelegate:
            return "Invalid app delegate"
        case .invalidImageURL:
            return "Invalid image URL"
        case .invalidImageData:
            return "Invalid image data"
        case .failedToSaveImage:
            return "Failed to save image"
        case .failedToSaveData:
            return "Failed to save data"
        }
    }
}
