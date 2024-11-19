//
//  HomePageTabs+Enum.swift
//  KnowQ
//
//  Created by Emmanuel Biju on 12/11/24.
//

import Foundation
enum HomePageTab: Int, CaseIterable{
    case watchlist = 0
    case consultations = 1
    case reports = 2
    
    var title: String{
        switch self {
        case .watchlist:
            return "Watchlist"
        case .consultations:
            return "Consultations"
        case .reports:
            return "Reports"
        
        }
    }
    
    var iconName: String{
        switch self {
        case .watchlist:
            return "list.dash"
        case .consultations:
            return "square.and.pencil"
        case .reports:
            return "doc.text.below.ecg"
        }
    }
}
