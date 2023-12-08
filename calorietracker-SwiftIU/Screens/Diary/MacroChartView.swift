import SwiftUI
import Charts

@available(iOS 17.0, *)
struct MacroChartView: View {
    @ObservedObject var viewModel: DiaryViewModel
    
    var body: some View {
        let selectedDay = viewModel.diaryEntries[viewModel.selectedDayIndex]
        let macroValues = [
            (name: "Fat", count: selectedDay.dailyFat, color: Color.red),
            (name: "Protein", count: selectedDay.dailyProtein, color: Color.green),
            (name: "Carbs", count: selectedDay.dailyCarbs, color: Color.blue)
        ]
        
        HStack{
            
            // Macro
            VStack {
                ZStack{
                    Text("\(selectedDay.dailyCalories)\nkcal").font(.system(size: 12))
                    
                    // Sector Chart
                    Chart(macroValues, id: \.name) { item in
                        SectorMark(
                            angle: .value("Macro", item.count),
                            innerRadius:  .ratio(0.8),
                            outerRadius: .inset(1),
                            angularInset: 1
                            
                        )
                        //.foregroundStyle(item.color)
                        .foregroundStyle(by: .value("Type", item.name))
                        .cornerRadius(2)
                        
                        
                        
                    }
                    
                    .chartLegend(.visible)
                   
                    
                    
                }
                Text("Consumed").bold()
                
                
            }
            .frame(width: 150, height: 150)
            .aspectRatio(contentMode: .fit)
            
            
            // Burned Chart
            
            
            VStack {
                ZStack{
                    Text("\(selectedDay.dailyCalories)\nkcal").font(.system(size: 12))
                    
                    Chart {
                        
                        SectorMark(
                            angle: .value("Burned", 300),
                            innerRadius:  .ratio(0.8),
                            outerRadius: .inset(1),
                            angularInset: 1
                        )
                        .foregroundStyle(by: .value("Type", "Burned"))
                        .cornerRadius(2)
                        
                        SectorMark( angle: .value("BMR", 1700),
                                    innerRadius:  .ratio(0.8),
                                    outerRadius: .inset(1),
                                    angularInset: 1
                        )
                        .foregroundStyle(by: .value("Type", "BMR"))
                        .cornerRadius(2)
                        
                    }
                    //.chartLegend(.hidden)
                }
                Text("Burned").bold()
            }
            .frame(width: 150, height: 150)
            .aspectRatio(contentMode: .fit)
            
            // Remaining Chart
            /*VStack {
                ZStack{
                    Text("\(selectedDay.dailyCalories)\nkcal")
                    
                    Chart {
                        
                        SectorMark(
                            angle: .value("Burned", 300),
                            innerRadius:  .ratio(0.8),
                            outerRadius: .inset(1),
                            angularInset: 1
                        )
                        .foregroundStyle(by: .value("Type", "Burned"))
                        .cornerRadius(2)
                        
                        SectorMark( angle: .value("Consumed", 1700),
                                    innerRadius:  .ratio(0.8),
                                    outerRadius: .inset(1),
                                    angularInset: 1
                        )
                        .foregroundStyle(by: .value("Type", "Consumed"))
                        .cornerRadius(2)
                        
                        SectorMark( angle: .value("Remaining", 1700),
                                    innerRadius:  .ratio(0.8),
                                    outerRadius: .inset(1),
                                    angularInset: 1
                        )
                        .foregroundStyle(by: .value("Type", "Remaining"))
                        .cornerRadius(2)
                    }
                }
                Text("Remaining").bold()
            }
            //.padding()
            frame(width: 100, height: 200)
            .aspectRatio(contentMode: .fit)
            */
            
        }
    }
}




@available(iOS 17.0, *)
struct MacroChartView_Previews: PreviewProvider {
    static var previews: some View {
        MacroChartView(viewModel: DiaryViewModel())
    }
}



/*
 
 Chart {
 BarMark(x: .value("Type", "bird"),
 y: .value("Population", 1))
 .foregroundStyle(.pink)
 
 BarMark(x: .value("Type", "dog"),
 y: .value("Population", 2))
 .foregroundStyle(.green)
 
 BarMark(x: .value("Type", "cat"),
 y: .value("Population", 3))
 .foregroundStyle(.blue)
 }
 .aspectRatio(1, contentMode: .fit)
 .padding()
 
 
 
 Chart {
 ForEach(macroValues, id: \.name) { cat in
 SectorMark(angle: .value(cat.name, cat.count))
 }
 }
 .foregroundColor(.blue)
 .padding()
 .frame(width: 200, height: 200)
 .aspectRatio(contentMode: .fit)
 }else {
 
 BarChartView(data: ChartData(values: [
 ("Protein", 50),
 ("Carbs", 100),
 ("Protein", 50),
 ]),
 title: "Test",
 legend: "Values",
 style: Styles.barChartStyleOrangeLight)
 .padding()
 .frame(width: 184.07, height: 188.0)
 .background(Color.white)
 .cornerRadius(16)
 .aspectRatio(contentMode: .fit)  // Use .fit to maintain the aspect ratio
 
 PieChartView(data: [8, 23, 54, 32], title: "Test", legend: "Legendary")
 .padding()
 .frame(width: 200, height: 200)
 .aspectRatio(contentMode: .fit)  // Use .fit to maintain the aspect ratio */
