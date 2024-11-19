//
//  UIScreen+Extensions.swift
//  KnowQ
//
//  Created by Emmanuel Biju on 11/11/24.
//

import Foundation
#if canImport(UIKit)
    import UIKit
#endif

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
