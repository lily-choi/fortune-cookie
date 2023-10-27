//
//  FontManager.swift
//  EveryDayQuote
//
//  Created by Lily on 2023/10/25.
//

import SwiftUI

extension Font {
    enum MainFont {
        case semibold
        case custom(String)
        
        var value: String {
            switch self {
            case .semibold:
                return "KOTRA HOPE"
            case .custom(let name):
                return name
            }
        }
    }
    
    enum HanaFont {
        case semibold
        case custom(String)
        
        var value: String {
            switch self {
            case .semibold:
                return "나눔손글씨 하나손글씨"
            case .custom(let name):
                return name
            }
        }
    }
    
    static func mainfont(_ type: MainFont, size: CGFloat = 26) -> Font {
        return .custom(type.value, size: size)
    }
    
    static func hanafont(_ type: HanaFont, size: CGFloat = 26) -> Font {
        return .custom(type.value, size: size)
    }
    
}
