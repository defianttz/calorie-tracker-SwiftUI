// ViewModel for the User Model

import Foundation
import SwiftUI

class UserViewModel: ObservableObject {
    @Published var user: User = User(name: "Sammy", activityLevel: 1, basalMetabolicRate: 0, targets: Targets(calories: 0, protein: 0, carbs: 0, fat: 0, weightGoal: 0, bodyFatPercentage: 0), profile: Profile(age: 0, weight: 0, height: 0, bodyFatPercentage: 0))
    
    
    // Initialize the user
    init() {
        
        
        user = User(name: "Sammy", activityLevel: 1, basalMetabolicRate: 2000,
                    targets: Targets(calories: 2000, protein: 150, carbs: 200, fat: 50, weightGoal: 160, bodyFatPercentage: 10), profile: Profile(age: 20, weight: 150, height: 70, bodyFatPercentage: 15))
    }
    
    func calculateBasalMetabolicRate() {
        // Calculate BMR using the Harris-Benedict Equation
        // BMR = 10 * weight(kg) + 6.25 * height(cm) - 5 * age(y) + 5
        let weight = Double(user.profile.weight)
        let height = Double(user.profile.height)
        let age = Double(user.profile.age)
        
        let bmr = 10 * weight + 6.25 * height - 5 * age + 5
        
        user.basalMetabolicRate = Int(bmr)
    }
    
    func calculateTargets() {
        // Calculate targets using the Harris-Benedict Equation
        // BMR = 10 * weight(kg) + 6.25 * height(cm) - 5 * age(y) + 5
        let weight = Double(user.profile.weight)
        let height = Double(user.profile.height)
        let age = Double(user.profile.age)
        
        let bmr = 10 * weight + 6.25 * height - 5 * age + 5
        
        user.basalMetabolicRate = Int(bmr)
        
        // Calculate targets using the Harris-Benedict Equation
        // BMR = 10 * weight(kg) + 6.25 * height(cm) - 5 * age(y) + 5
        let weightGoal = Double(user.targets.weightGoal)
        let bodyFatPercentage = Double(user.targets.bodyFatPercentage)
        
        let bmrGoal = 10 * weightGoal + 6.25 * height - 5 * age + 5
        
        user.targets.calories = Int(bmrGoal)
        
        // Calculate protein
        // 1g of protein per pound of body weight
        user.targets.protein = Int(weightGoal)
        
        // Calculate fat
        // 0.3g of fat per pound of body weight
        user.targets.fat = Int(weightGoal * 0.3)
        
    }
    
}


    
   



