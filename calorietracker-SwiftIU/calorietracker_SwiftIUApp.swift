import SwiftUI

@main
struct calorietracker_SwiftIUApp: App {
    @StateObject private var diaryViewModel = DiaryViewModel()

        var body: some Scene {
            WindowGroup {
                ContentView()
                    .environmentObject(diaryViewModel)
            }
        }
}

struct ContentView: View {
    @EnvironmentObject var diaryViewModel: DiaryViewModel
    
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
        }
    }
}
