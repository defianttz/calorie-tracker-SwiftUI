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
    
    /*
    private func updateTotals() {
        guard selectedDayIndex < diaryEntries.count else { return }

        // Update totals for the selected day
        let dayEntry = diaryEntries[selectedDayIndex]
        dayEntry.dailyCalories = dayEntry.meals.reduce(0) { $0 + $1.totalCalories }
        dayEntry.dailyFat = dayEntry.meals.reduce(0) { $0 + $1.totalFat }
        dayEntry.dailyProtein = dayEntry.meals.reduce(0) { $0 + $1.totalProtein }
        dayEntry.dailyCarbs = dayEntry.meals.reduce(0) { $0 + $1.totalCarbs }
    }*/

    init() {
        for _ in 1...7 {
            diaryEntries.append(DiaryEntry(meals: [], date: Date(), dailyCalories: 0, dailyFat: 0, dailyProtein: 0, dailyCarbs: 0))
        }
        

        // Dummy data for the first day (you can customize as needed)
        /*diaryEntries[0].meals = [
            Meal(category: "Breakfast", foods: [
                Food(name: "Eggs Benedict", calories: 600, fat: 40, protein: 20, carbs: 40, category: "breakfast"),
                // Add more breakfast foods as needed
            ]),
            Meal(category: "Lunch", foods: [
                Food(name: "Caesar Salad", calories: 350, fat: 25, protein: 10, carbs: 15, category: "Lunch"),

                // Add lunch foods as needed
            ]),
            Meal(category: "Dinner", foods: [
                Food(name: "Grilled Chicken", calories: 250, fat: 10, protein: 30, carbs: 5, category: "breakfast"),
                // Add dinner foods as needed
            ]),
            Meal(category: "Snack", foods: [
                // Add snack foods as needed
            ])
        ]*/
        
        addFoodToSelectedDay(Food(name: "Eggs Benedict", calories: 600, fat: 40, protein: 20, carbs: 40, category: .breakfast),   category: .breakfast)
        addFoodToSelectedDay(Food(name: "Steelcut Oats", calories: 300, fat: 2, protein: 5, carbs: 50, category: .breakfast),   category: .breakfast)
        
        addFoodToSelectedDay(Food(name: "Caesar Salad", calories: 350, fat: 25, protein: 10, carbs: 15, category: .lunch),   category: .lunch)
        
        addFoodToSelectedDay(Food(name: "Grilled Chicken", calories: 250, fat: 10, protein: 30, carbs: 5, category: .dinner),   category: .dinner)
        
        
        
    }
}

func addFood(mealType: String) {
    // Add logic to add a food to the selected day
}
