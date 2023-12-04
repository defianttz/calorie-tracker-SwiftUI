import SwiftUI

struct MealView: View {
    @Binding var isExpanded: Bool
    let meal: Meal
    @ObservedObject var viewModel: DiaryViewModel
    
    var body: some View {
        Section {
            HStack {
                // Plus Button with Menu
                Menu {
                    Button(action: {
                        print("Add Biometric selected")
                    }) {
                        Label("Add Biometric", systemImage:"bolt.heart")
                    }
                    Button(action: {
                        print("Add Exercise selected")
                    }) {
                        Label("Add Exercise", systemImage:"figure.run")
                    }
                    Button(action: {
                        print("Add Food selected")
                    }) {
                        Label("Add Food", systemImage: "apple.logo")
                    }
                    
                    
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.accentColor)
                }
                .menuStyle(BorderlessButtonMenuStyle())  // Use BorderlessButtonMenuStyle
                
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        isExpanded.toggle()
                        print("Collapse pressed")
                    }
                }) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(meal.category.rawValue)
                                .font(.system(size: 16))
                            
                            if (meal.totalCalories ?? 0) > 0 {
                                Text("\(meal.totalCalories ?? 0) kcal, \(meal.totalProtein ?? 0) g protein, \(meal.totalCarbs ?? 0) g carbs, \(meal.totalFat ?? 0) g fat")
                                    .font(.system(size: 10))
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(1)
                            }
                        }
                        
                        Spacer()
                        
                        Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                            .foregroundColor(.accentColor)
                    }
                }
                .buttonStyle(BorderlessButtonStyle())  // Use BorderlessButtonStyle
            }
            
            if isExpanded {
                ForEach(meal.foods.indices, id: \.self) { index in
                    FoodView(newFood: meal.foods[index])
                }
                .onDelete(perform: { indexSet in
                    viewModel.removeFoodFromSelectedDay(at: indexSet.first!, category: meal.category)
                })
            }
        }
    }
}


struct MealView_Previews: PreviewProvider {
    @State static var isExpanded = false
    static var previewMeal = Meal(category: .lunch, foods: [Food(name: "Sample", calories: 100, fat: 8, protein: 20, carbs: 25, category: .lunch)])
    
    static var previews: some View {
        MealView(isExpanded: $isExpanded, meal: previewMeal, viewModel: DiaryViewModel())
        
    }
}
// Create a new MealView
/*struct MealView: View {
 var mealName: String
 @Binding var isExpanded: Bool
 var foods: [Food]
 
 var body: some View {
 Section {
 HStack {
 Button(action: {
 withAnimation {
 print("Button pressed")
 }
 }) {
 Image(systemName: "plus").foregroundColor(.accentColor)
 }
 Spacer()
 Button(action: {
 withAnimation {
 isExpanded.toggle()
 }
 }) {
 HStack {
 VStack {
 Text(mealName)
 
 
 }
 //Text(mealName)
 Spacer()
 Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
 .foregroundColor(.accentColor)
 }
 }
 }
 
 if isExpanded {
 ForEach(foods, id: \.name) { food in
 //Text(food.name)
 FoodView(newFood: food)
 
 // Display other food properties as needed
 }
 }
 }
 }
 }
 struct MealView_Previews: PreviewProvider {
 @State static var isExpanded = false
 
 static var previews: some View {
 MealView(
 mealName: "Lunch",
 isExpanded: $isExpanded,
 foods: [Food(name: "Sample", calories: 100, fat: 8, protein: 20, carbs: 25, category: "Lunch")]
 )
 }
 }*/







