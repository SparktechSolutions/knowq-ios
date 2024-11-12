//
//  UserType.swift
//  KnowQ
//
//  Created by Emmanuel Biju on 11/11/24.
//

import Foundation
import CoreData

enum UserType: String, Decodable {
    case doctor = "Doctor"
    case patient = "Patient"
}
