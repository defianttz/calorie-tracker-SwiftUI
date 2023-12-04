//
//  MealListView.swift
//  calorietracker-SwiftIU
//
//  Created by Guzman, Sammy on 11/30/23.
//

import SwiftUI

struct MealListView: View {
    
    @State private var isExpanded = false
    var body: some View {
        Group {
            HStack {
                Button(action: {
                    withAnimation {
                        //isSnackExpanded.toggle()
                        print("adding breakfast")
                    }
                }){
                    
                    Image(systemName: "plus").foregroundColor(.accentColor)
                }
                Text("Breakfast")
                    .font(.system(size: 16))
                Spacer()
                
                
                
                
                
            }
        }
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
