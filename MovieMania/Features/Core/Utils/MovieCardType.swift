//
//  MovieCardType.swift
//  MovieMania
//
//  Created by Boubacar sidiki barry on 13.02.24.
//

import Foundation


enum MovieCardType {
    case poster , grid
}

extension MovieCardType {
    var widthPercent : Double {
        switch self {
        case .poster :
            return 0.45
        case .grid :
            return 0.20
        }
    }
    
    var heightPercent : Double {
        switch self {
        case .poster :
            return 0.60
        case .grid :
            return 0.30
        }
    }
}
