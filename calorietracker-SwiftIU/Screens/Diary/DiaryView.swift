// DiaryView.swift

import SwiftUI
import SwiftUICharts


struct DiaryView: View {
    @ObservedObject var viewModel: DiaryViewModel
    
    // State variable to track the visibility of the meal sections
    @State private var isBreakfastExpanded = false
    @State private var isLunchExpanded = false
    @State private var isDinnerExpanded = false
    @State private var isSnackExpanded = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.secondBackGround.ignoresSafeArea(.all)
                VStack {
                    
                    //VStack {
                        HStack {
                            Button(action: {
                                viewModel.selectedDayIndex = max(viewModel.selectedDayIndex - 1, 0)
                            }) {
                                Image(systemName: "chevron.left")
                            }.padding(.horizontal, 10.0)
                            
                            Text("Day \(viewModel.selectedDayIndex + 1)")
                                .padding(.horizontal, 10.0)
                            Button(action: {
                                viewModel.selectedDayIndex = min(viewModel.selectedDayIndex + 1, viewModel.diaryEntries.count - 1)
                            }) {
                                Image(systemName: "chevron.right")
                            }
                        }
                        
                        if #available(iOS 17.0, *) {
                            MacroChartView(viewModel: viewModel)
                        } else {
                            // Fallback on earlier versions
                        }
                        
                    //}
                    
                    
                    
                    Group{
                        // Food Entry Section
                        List {
                            MealView(
                                isExpanded: $isBreakfastExpanded,
                                meal: viewModel.diaryEntries[viewModel.selectedDayIndex].meals.first(where: { $0.category == .breakfast }) ?? Meal(category: .breakfast, foods: []),
                                viewModel: viewModel
                            )
                            
                            MealView(
                                isExpanded: $isLunchExpanded,
                                meal: viewModel.diaryEntries[viewModel.selectedDayIndex].meals.first(where: { $0.category == .lunch }) ?? Meal(category: .lunch, foods: []), viewModel: viewModel
                            )
                            
                            MealView(
                                isExpanded: $isDinnerExpanded,
                                meal: viewModel.diaryEntries[viewModel.selectedDayIndex].meals.first(where: { $0.category == .dinner }) ?? Meal(category: .dinner, foods: []), viewModel: viewModel
                            )
                            
                            MealView(
                                isExpanded: $isSnackExpanded,
                                meal: viewModel.diaryEntries[viewModel.selectedDayIndex].meals.first(where: { $0.category == .snack }) ?? Meal(category: .snack, foods: []),
                                viewModel: viewModel
                            )
                        }.listStyle(InsetGroupedListStyle())
                    }.background(Color.gray)
                }//.padding(.top, 70.0).background(Color.white)
                //.navigationBarTitle("Diary")
            }//.background(Color.secondBackGround).ignoresSafeArea()
        }
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView(viewModel: DiaryViewModel())
    }
}
