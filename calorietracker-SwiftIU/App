import SwiftUI

@main
struct calorietracker_SwiftIUApp: App {
    @StateObject private var diaryViewModel = DiaryViewModel()
    @StateObject private var userViewModel = UserViewModel()
    
    
        var body: some Scene {
            WindowGroup {
                ContentView()
                    .environmentObject(diaryViewModel)
                    .environmentObject(userViewModel)
            }
        }
}





