import SwiftUI

struct ContentView: View {
    @EnvironmentObject var diaryViewModel: DiaryViewModel
    @StateObject private var userProfileModel = UserViewModel()
    var body: some View {
        TabView {
            DashboardView(viewModel: diaryViewModel)
                .tabItem {
                    Label("Dashboard", systemImage: "chart.pie.fill")
                }
            
            DiaryView(viewModel: diaryViewModel)
                .tabItem {
                    Label("Diary", systemImage: "book.fill")
                }
            FoodTabView()
                .tabItem { Label("Food", systemImage: "carrot.fill")
                }
            UserProfileView(model: userProfileModel)
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }
        }
    }
}
