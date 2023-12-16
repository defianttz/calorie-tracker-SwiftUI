import Foundation
import SwiftUI

class DiaryViewModel: ObservableObject {
    @Published var diaryEntries: [DiaryEntry] = []
    @Published var selectedDayIndex: Int = 0
    
    func addFoodToSelectedDay(_ food: Food, category: MealCategory) {
        guard selectedDayIndex < diaryEntries.count else { return }
        
        // Find the meal with the specified category
        if let index = diaryEntries[selectedDayIndex].meals.firstIndex(where: { $0.category == category }) {
            diaryEntries[selectedDayIndex].meals[index].foods.append(food)
        } else {
            // Create a new meal if it doesn't exist n
            let newMeal = Meal(category: category , foods: [food], totalCalories: 0, totalFat: 0, totalProtein: 0, totalCarbs: 0)
            diaryEntries[selectedDayIndex].meals.append(newMeal)
        }
        
        // Update totals
        updateTotals()
    }
    
    
    func removeFoodFromSelectedDay(at index: Int, category: MealCategory) {
        guard selectedDayIndex < diaryEntries.count else { return }
        
        guard let mealIndex = diaryEntries[selectedDayIndex].meals.firstIndex(where: { $0.category == category }) else { return }
        
        diaryEntries[selectedDayIndex].meals[mealIndex].foods.remove(at: index)
        
        updateTotals()
    }
    
    func addRandomFoods(to dayIndex: Int) {
        
        
        
        switch dayIndex {
        case 0, 1, 2, 3, 4, 5, 6: // Sample foods for all days
            addFoodToSelectedDay(generateRandomFood(category: .breakfast), category: .breakfast)
            addFoodToSelectedDay(generateRandomFood(category: .lunch), category: .lunch)
            addFoodToSelectedDay(generateRandomFood(category: .dinner), category: .dinner)
        // Add more cases for other days if needed
        default:
            break
        }
    }

    func generateRandomFood(category: MealCategory) -> Food {
        let foodNames = ["Chicken Salad", "Spaghetti Bolognese", "Vegetarian Stir-Fry", "Quinoa Salad", "Salmon with Asparagus", "Avocado Toast", "Omelette"]
        let randomIndex = Int.random(in: 0..<foodNames.count)
        let randomCalories = Int.random(in: 200...500)
        let randomFat = Int.random(in: 5...20)
        let randomProtein = Int.random(in: 10...30)
        let randomCarbs = Int.random(in: 20...50)

        return Food(name: foodNames[randomIndex], calories: randomCalories, fat: randomFat, protein: randomProtein, carbs: randomCarbs, category: category)
    }
 
    
    
    var weightData: [(date: Date, weight: Double)] {
        var data: [(date: Date, weight: Double)] = []
        var lastWeight: Double = 0.0 // Default weight
        for entry in diaryEntries {
            let weight = entry.weight ?? lastWeight
            data.append((entry.date, weight))
            if let entryWeight = entry.weight {
                lastWeight = entryWeight
            }
        }
        return data
    }
    
    
    
    private func updateTotals() {
        guard selectedDayIndex < diaryEntries.count else { return }
        
        var dailyCalories = 0
        var dailyFat = 0
        var dailyProtein = 0
        var dailyCarbs = 0
        
        // Update totals for the selected day
        for index in diaryEntries[selectedDayIndex].meals.indices {
            diaryEntries[selectedDayIndex].meals[index].totalCalories = diaryEntries[selectedDayIndex].meals[index].foods.reduce(0) { $0 + $1.calories }
            diaryEntries[selectedDayIndex].meals[index].totalFat = diaryEntries[selectedDayIndex].meals[index].foods.reduce(0) { $0 + $1.fat }
            diaryEntries[selectedDayIndex].meals[index].totalProtein = diaryEntries[selectedDayIndex].meals[index].foods.reduce(0) { $0 + $1.protein }
            diaryEntries[selectedDayIndex].meals[index].totalCarbs = diaryEntries[selectedDayIndex].meals[index].foods.reduce(0) { $0 + $1.carbs }
            
        }
        
        // Update totals for the selected day
        for meal in diaryEntries[selectedDayIndex].meals {
            dailyCalories += meal.totalCalories ?? 0
            dailyFat += meal.totalFat ?? 0
            dailyProtein += meal.totalProtein ?? 0
            dailyCarbs += meal.totalCarbs ?? 0
        }
        
        diaryEntries[selectedDayIndex].dailyCalories = dailyCalories
        diaryEntries[selectedDayIndex].dailyFat = dailyFat
        diaryEntries[selectedDayIndex].dailyProtein = dailyProtein
        diaryEntries[selectedDayIndex].dailyCarbs = dailyCarbs
        
    }
    
    
    init() {
        
        let startDate = Calendar.current.date(from: DateComponents(year: 2023, month: 12, day: 1))!
        
        for index in 0..<7 {
            selectedDayIndex = index
            let currentDate = Calendar.current.date(byAdding: .day, value: index, to: startDate)!
            let weight = Double.random(in: 150.0...180.0)
            diaryEntries.append(DiaryEntry(meals: [], date: currentDate, weight: weight, dailyCalories: 0, dailyFat: 0, dailyProtein: 0, dailyCarbs: 0))
        
            // Add random foods to each day
            addRandomFoods(to: index)
        }
        selectedDayIndex = 0
        
        /*
        addFoodToSelectedDay(Food(name: "Eggs Benedict", calories: 600, fat: 40, protein: 20, carbs: 40, category: .breakfast),   category: .breakfast)
        addFoodToSelectedDay(Food(name: "Steelcut Oats", calories: 300, fat: 2, protein: 5, carbs: 50, category: .breakfast),   category: .breakfast)
        
        addFoodToSelectedDay(Food(name: "Caesar Salad", calories: 350, fat: 25, protein: 10, carbs: 15, category: .lunch),   category: .lunch)
        
        addFoodToSelectedDay(Food(name: "Grilled Chicken", calories: 250, fat: 10, protein: 30, carbs: 5, category: .dinner),   category: .dinner)
        */
        
        
    }
    
    // Calculate weekly macros history for chart
    
    
    
    
}

