//
//  userData.swift
//  Water app
//
//  Created by Steven Gonzalez on 5/31/24.
//

import SwiftUI

class UserData: ObservableObject {
    @Published var name: String = ""
    @Published var age: String = ""
    @Published var weight: Int = 0
    var waterIntake: Double {
        return Double(weight) * (2/3)
    }
}
