//
//  MenuPopupView.swift
//  calorietracker-SwiftIU
//
//  Created by Sammy on 12/2/23.
//

import SwiftUI

struct MenuPopupView: View {
    var body: some View {
        Menu {
            Button("Add Food") {
                // Handle adding food
                print("Add Food selected")
            }

            Button("Add Drink") {
                // Handle adding drink
                print("Add Drink selected")
            }
        } label: {
            Image(systemName: "plus")
                .foregroundColor(.accentColor)
        }
        .menuStyle(BorderlessButtonMenuStyle())  // Use BorderlessButtonMenuStyle
    }
}

struct MenuPopupView_Previews: PreviewProvider {
    static var previews: some View {
        MenuPopupView()
    }
}
