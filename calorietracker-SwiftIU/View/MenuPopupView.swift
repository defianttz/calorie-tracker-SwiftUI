//
//  MenuPopupView.swift
//  calorietracker-SwiftIU
//
//  Created by Sammy on 12/2/23.
//

import SwiftUI

struct MenuPopupView: View {
    //@ObservedObject var viewModel: UserViewModel

    var body: some View {
        
        NavigationStack{
            Menu {
                NavigationLink(destination: Text("View 1")) {
                    Label("Profile", systemImage: "person")
                }
                NavigationLink(destination: Text("Test")) {
                    Label("Settings", systemImage: "gear")
                }
                
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.accentColor)
            }
            .menuStyle(BorderlessButtonMenuStyle())  // Use BorderlessButtonMenuStyle
        }
        
    }
}

struct MenuPopupView_Previews: PreviewProvider {
    static var previews: some View {
        MenuPopupView()
    }
}
