//
//  FoodRow.swift
//  calorietracker-SwiftIU
//
//  Created by Sammy on 11/27/23.
//

import SwiftUI

struct FoodRow: View {
    let newFood: Food
    
    var body: some View {
        HStack {
            Image(systemName: "apple.logo")
                .foregroundColor(Color.red)
       
    
            VStack(alignment: .leading) {
                Text(newFood.name)
                    .font(.system(size: 16)) // Set the font size for the whole text
                Text("1 serving")
                    .font(.system(size: 10)) // Set the font size for the
                    .multilineTextAlignment(.leading) // Align the whole text to the center
                    .lineLimit(1) // Limit the number of lines to 1
            }
            Spacer()
            VStack(alignment: .trailing){
                Text("\(newFood.calories)\nkcal")
                    .font(.system(size: 10)) // Set the font size for the
                
                
            }
        }
        /*HStack {
            VStack(alignment: .leading) {
                Text(newFood.name)
                    .font(.system(size: 16)) // Set the font size for the whole text
                Text("\(newFood.calories) kcal, \(newFood.protein) g protein, \(newFood.carbs) g carbs, \(newFood.fat) g fat")
                    .font(.system(size: 10)) // Set the font size for the
                    .multilineTextAlignment(.leading) // Align the whole text to the center
                    .lineLimit(1) // Limit the number of lines to 1
            }
        }*/
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodRow(newFood: Food(name: "Eggs Benedict", calories: 600, fat: 40, protein: 20, carbs: 40, category: .breakfast))
    }
}
