import SwiftUI

struct MealView: View {
    @Binding var isExpanded: Bool
    let meal: Meal
    @ObservedObject var viewModel: DiaryViewModel
    @State private var isAddFoodViewPresented = false

    var body: some View {
        //VStack {
            Section {
                HStack {
                    // Plus Button with Menu
                    Menu {
                        Button(action: {
                            print("Add Biometric selected")
                        }) {
                            Label("Add Biometric", systemImage: "bolt.heart")
                        }
                        Button(action: {
                            print("Add Exercise selected")
                        }) {
                            Label("Add Exercise", systemImage: "figure.run")
                        }

                        // Add Food Button in the menu
                        Button(action: {
                            isAddFoodViewPresented.toggle()
                        }) {
                            Label("Add Food", systemImage: "apple.logo")
                        }
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.accentColor)
                    }
                    .menuStyle(BorderlessButtonMenuStyle())

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
                                .foregroundColor(Color.secondForeGround)
                        }.foregroundColor(Color.secondForeGround)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }

                if isExpanded {
                    ForEach(meal.foods.indices, id: \.self) { index in
                        FoodRow(newFood: meal.foods[index])
                    }
                    .onDelete(perform: { indexSet in
                        viewModel.removeFoodFromSelectedDay(at: indexSet.first!, category: meal.category)
                    })
                }
            }
        //}
        .sheet(isPresented: $isAddFoodViewPresented) {
            AddFoodView(category: meal.category, viewModel: viewModel, isPresented: $isAddFoodViewPresented)
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
