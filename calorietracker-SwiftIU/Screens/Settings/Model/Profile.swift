//
//  Profile.swift
//  calorietracker-SwiftIU
//
//  Created by Sammy on 11/28/23.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    var name: String
    
    // Body
    var activityLevel: Int
    var basalMetabolicRate: Int // Calculated from the Harris-Benedict Equation

    // Goals
    var targets : Targets
    var profile : Profile

}

struct Profile {
    var age: Int
    var weight: Int
    var height: Int
    var bodyFatPercentage: Int
}


struct Targets {
    // Nutrition
    var calories:Int = 0
    var protein: Int = 0
    var carbs: Int = 0
    var fat: Int = 0

    // Body
    var weightGoal: Int = 0
    var bodyFatPercentage: Int = 0
    
}
// Steps for a new User
// 1. Starting profile info
//      - Sex
//      - Age or birthday
//      - Height
//      - Weight
// 2. Activity Level
// 3. Account info
//      - Name
//      - Email
//      - Password


