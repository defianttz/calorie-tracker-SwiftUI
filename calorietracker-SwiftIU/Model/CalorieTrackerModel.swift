//
//  CalorieTrackerModel.swift
//  calorietracker-SwiftIU
//
//  Created by Sammy on 12/5/23.
//

import Foundation


class CalorieTrackerModel: ObservableObject {
    @Published var user: User?
    @Published var targets: Targets?
    @Published var profile: Profile?
    
}
