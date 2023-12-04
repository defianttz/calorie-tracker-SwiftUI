import Foundation

// Enum for meal categories
enum MealCategory: String, CaseIterable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case snack = "Snack"
}



struct Food {
    var name: String
    var calories: Int
    var fat: Int
    var protein: Int
    var carbs: Int
    //var category: String
    var category: MealCategory
}

struct Meal: Identifiable {
    let id = UUID()
    var category: MealCategory
    var foods: [Food]
    
    var totalCalories: Int?
    
    var totalFat: Int?
    
    var totalProtein: Int?
    
    var totalCarbs: Int?
}



