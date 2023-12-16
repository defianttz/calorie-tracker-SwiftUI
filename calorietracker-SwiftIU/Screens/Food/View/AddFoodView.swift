import SwiftUI

struct AddFoodView: View {
    let category: MealCategory
    @ObservedObject var viewModel: DiaryViewModel
    @State private var foodName: String = ""
    @State private var caloriesString: String = "100"
    @State private var fatString: String = "10"
    @State private var proteinString: String = "10"
    @State private var carbsString: String = "10"
    @State private var servingSizeString: String = "1"
    @Binding var isPresented: Bool

    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    var body: some View {
        NavigationView {
            //Color.appBackGround.ignoresSafeArea(.all)
            VStack {
                
                Form {
                    Section(header: Text("Food Details")) {
                        HStack {
                            Text("Food Name:")
                            Spacer()
                            TextField("e.g. Clif Bar, Rice", text: $foodName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 200)
                                .disableAutocorrection(true)
                        }

                        HStack {
                            Text("Serving Size")
                            Spacer()
                            TextField("e.g. 1", text: $servingSizeString)
                                .padding(1.67)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 100)
                                .disableAutocorrection(true)
                            Text("g")
                        }
                    }

                    Section(header: Text("Nutrition Details")) {
                        HStack {
                            Text("Energy")
                            Spacer()
                            TextField("e.g. 200", text: $caloriesString)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 100)
                                .disableAutocorrection(true)
                            Text("kcal")
                        }

                        HStack {
                            Text("Fat")
                            Spacer()
                            TextField("e.g. 10", text: $fatString)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 100.0)
                                .disableAutocorrection(true)
                            Text("g")
                        }

                        HStack {
                            Text("Protein")
                            Spacer()
                            TextField("e.g. 10", text: $proteinString)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 100)
                                .disableAutocorrection(true)
                            Text("g")
                        }

                        HStack {
                            Text("Carbs")
                            Spacer()
                            TextField("e.g. 10", text: $carbsString)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: 100)
                                .disableAutocorrection(true)
                            Text("g")
                        }
                    }
                }

                Button("Save Food") {
                    guard
                        let calories = Int(caloriesString),
                        let fat = Int(fatString),
                        let protein = Int(proteinString),
                        let carbs = Int(carbsString),
                        let servingSize = Int(servingSizeString)
                    else {
                        // Handle invalid input
                        return
                    }

                    let newFood = Food(name: foodName, calories: calories, fat: fat, protein: protein, carbs: carbs, category: category)
                    viewModel.addFoodToSelectedDay(newFood, category: category)
                    isPresented = false
                }
            }
        }
    }
}


struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView(category: .breakfast, viewModel: DiaryViewModel(), isPresented: .constant(true))
    }
}
