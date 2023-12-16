import Foundation

struct DiaryEntry: Identifiable {
    var id: UUID = UUID()
    var meals: [Meal]
    
    
    var date: Date
    var weight: Double? // Add this line
    var dailyCalories: Int
    var dailyFat: Int
    var dailyProtein: Int
    var dailyCarbs: Int
}
