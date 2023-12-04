//
//  EnergyChart.swift
//  calorietracker-SwiftIU
//
//  Created by Sammy on 12/3/23.
//

import SwiftUI
import Charts

struct EnergyChart: View {
    
    struct macros:Identifiable {
        var id = UUID()
        let date:String
        let type: String
        let value: Double
    }
    
    let data: [macros] = [
        
        macros(date: "1",type: "Fat", value: 30),
        macros(date: "1",type: "Protein", value: 35),
        macros(date: "1",type: "Carbs", value: 35),
        
        macros(date: "2",type: "Fat", value: 30),
        macros(date: "2",type: "Protein", value: 35),
        macros(date: "2",type: "Carbs", value: 35),
        
        macros(date: "3",type: "Fat", value: 30),
        macros(date: "3",type: "Protein", value: 35),
        macros(date: "3",type: "Carbs", value: 35),
        
        macros(date: "4",type: "Fat", value: 30),
        macros(date: "4",type: "Protein", value: 35),
        macros(date: "4",type: "Carbs", value: 35),
    ]
    
    var body: some View {
        
        VStack (alignment: .leading){
            Label("Forecast", systemImage: "cloud.sun")
            
            Chart(data){ macro in
                BarMark(
                    x: .value("date", macro.date),
                    y: .value("macro", macro.value)
                )
                .foregroundStyle(by: .value("Type",macro.type))
                .opacity(0.5)
            }
            .frame(minWidth: 1)
            
        }
        .padding(10)
        .background()
        
        
        
        
        
        
    }
}
    
    #Preview {
        EnergyChart()
    }
