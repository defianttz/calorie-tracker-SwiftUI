//
//  UserProfileView.swift
//  calorietracker-SwiftIU
//
//  Created by Sammy on 12/5/23.
//

import SwiftUI

struct UserProfileView: View {
    @ObservedObject var model: UserViewModel
   
   
   
    var body: some View {
        
        @State var date = Date()
        @State var age = Int()
        
        VStack {
            List{
                
                Section(header: Text("Body")){
                    HStack{
                        Text("Age")
                        Spacer()
                                   
                        Text("\(model.user.profile.age)")
                        
                        //Text("\(model.user.profile.age)")
                    }
                    HStack{
                        Text("Weight")
                        Spacer()
                        
                        Text("\(model.user.profile.weight)")
                    }
                    HStack{
                        Text("Height")
                        Spacer()
                        Text("\(model.user.profile.height)")
                    }
                    HStack{
                        Text("Body Fat Percentage")
                        Spacer()
                        Text("\(model.user.profile.bodyFatPercentage) %")
                    }
                }
                
                Section(header: Text("Goals")){
                    HStack{
                        Text("Calories")
                        Spacer()
                        Text("\(model.user.targets.calories)")
                    }
                    HStack{
                        Text("Protein")
                        Spacer()
                        Text("\(model.user.targets.protein)")
                    }
                    HStack{
                        Text("Carbs")
                        Spacer()
                        Text("\(model.user.targets.carbs)")
                    }
                    HStack{
                        Text("Fat")
                        Spacer()
                        Text("\(model.user.targets.fat)")
                    }
                    HStack{
                        Text("Weight Goal")
                        Spacer()
                        Text("\(model.user.targets.weightGoal)")
                    }
                    HStack{
                        Text("Body Fat Percentage")
                        Spacer()
                        Text("\(model.user.targets.bodyFatPercentage)")
                    }
                }
                
                Section(header: Text("Activity")){
                    HStack{
                        Text("Activity Level")
                        Spacer()
                        Text("\(model.user.activityLevel)")
                    }
                    HStack{
                        Text("Basal Metabolic Rate")
                        Spacer()
                        Text("\(model.user.basalMetabolicRate)")
                    }
                }
                
            }
            
        }
    }
}




#Preview {
    
    UserProfileView(model: UserViewModel())
    
    /*UserProfileView(user: User(name: "Sammy", activityLevel: 1, basalMetabolicRate: 2000, targets: Targets(calories: 2000, protein: 150, carbs: 200, fat: 50, weightGoal: 160, bodyFatPercentage: 10), profile: Profile(age: 20, weight: 150, height: 70, bodyFatPercentage: 15)))*/
}
