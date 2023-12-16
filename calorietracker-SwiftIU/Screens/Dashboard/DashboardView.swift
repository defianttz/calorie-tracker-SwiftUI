import SwiftUI
import SwiftUICharts
import Charts
struct DashboardView: View {
    @ObservedObject var viewModel: DiaryViewModel
    @EnvironmentObject var user: UserViewModel
    var body: some View {
        
        
        ZStack {
            Color.secondBackGround.ignoresSafeArea()
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "figure.track.and.field") // Replace "AppLogo" with your actual logo image name
                        .resizable()
                        .foregroundColor(Color.orange)
                        .scaledToFit()
                        .frame(height: 40.0) // Adjust the size as needed
                    Text("CalorieTracker") // Replace "AppName" with your actual app name
                        .font(.title2).fontDesign(.serif)
                    Spacer()
                }
                .padding([.leading, .bottom], 35.74)
                //.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                
                //.background(Color.white)
                //.cornerRadius(12)
                //.shadow(radius: 5)
                //.frame(height: 280)
                VStack{
                    Divider()
                    Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                        CardView {
                            EnergyChart(viewModel: viewModel)
                            
                        }
                        
                        CardView {
                            WeightChangeChart(viewModel: viewModel)
                        }
                    }
                    
                    
                    .padding(.horizontal)
                    //.padding([.horizontal, .bottom], 16)
                    
                }.background(Color.appBackGround)
            }
            
            
            .edgesIgnoringSafeArea(.top)
            .navigationBarTitle("Dashboard")
        }
    }
}

struct WeightChangeChart2: View {
    @ObservedObject var viewModel: DiaryViewModel
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Weight Change")
                .font(.headline)
            Chart {
                ForEach(viewModel.weightData, id: \.date) { data in
                    LineMark(
                        x: .value("Date", dateFormatter.string(from: data.date)),
                        y: .value("Weight", data.weight)
                    )
                }
            }
        }
    }
}

struct WeightChangeChart: View {
    @ObservedObject var viewModel: DiaryViewModel
    @EnvironmentObject var user: UserViewModel // Inject UserViewModel as an environment object
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter
    }()
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Weight Change")
                .font(.headline)
            var minY = viewModel.weightData.map { $0.weight }.min() ?? 0
            let maxY = viewModel.weightData.map { $0.weight }.max() ?? 100
            let weightLimit = user.user.targets.weightGoal
            
            
            
            
            
            Chart {
                RuleMark(y: .value("Goal", weightLimit))
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [2]))
                    .foregroundStyle(Color.appForeGround)
                    .annotation(alignment: .topTrailing){
                        Text("Goal Weight: \(weightLimit)")
                            .font(.subheadline).bold()
                            .padding(.trailing,32)
                            .foregroundStyle(Color.appForeGround)
                    }
                
                ForEach(viewModel.weightData, id: \.date) { data in
                    LineMark(
                        x: .value("Date", self.dateFormatter.string(from: data.date)),
                        y: .value("Weight", data.weight)
                    )
                }
            }
            .chartLegend(.visible)
            .chartYScale(domain: (minY-10)...(maxY+10)) // Adjust the range based on your preference
            
        }
        .padding(.bottom, 25.0)
        
        
    }
    
}




struct CardView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .padding()
            .background(Color.secondBackGround)
            .cornerRadius(12)
            .shadow(radius: 5)
            .frame(height: 280)
        
    }
}

var calorieconsumed: some View {
    
    // Chart for calories consumed using Charts (iOS 17)
    BarChartView(data: ChartData(values: [
        ("Mon", 12),
        ("Tue", 4),
        ("Wed", 8),
        ("Thu", 7),
        ("Fri", 3),
        ("Sat", 2),
        ("Sun", 6)
    ]), title: "Calories Consumed", legend: "Last 7 days", form: ChartForm.extraLarge)
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(viewModel: DiaryViewModel())
            .environmentObject(UserViewModel()) // Provide UserViewModel as an environment object
    }
}

