import SwiftUI
import SwiftUICharts
import Charts
struct DashboardView: View {
    @ObservedObject var viewModel: DiaryViewModel
    
    var body: some View {

        
        ScrollView {
            VStack(alignment: .leading) {
                Label("Welcome back, Sammy", systemImage: "person.crop.circle")
                    .font(.title)
                    .padding(.bottom)
                Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                    CardView {
                        EnergyChart()
                    }
                    CardView {
                        EnergyChart()
                    }
                    CardView {
                        WeightChangeChart()
                    }
                   
                    
                }
                .padding(.horizontal)
                //.padding([.horizontal, .bottom], 16)
                
            }
            .navigationBarTitle("Dashboard")
        }
    }
}

struct WeightChangeChart: View {
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter
    }()

    let weightData: [(date: Date, weight: Double)] = [
        (Calendar.current.date(byAdding: .day, value: -6, to: Date())!, 60.0),
        (Calendar.current.date(byAdding: .day, value: -5, to: Date())!, 60.5),
        (Calendar.current.date(byAdding: .day, value: -4, to: Date())!, 61.0),
        (Calendar.current.date(byAdding: .day, value: -3, to: Date())!, 60.8),
        (Calendar.current.date(byAdding: .day, value: -2, to: Date())!, 60.6),
        (Calendar.current.date(byAdding: .day, value: -1, to: Date())!, 60.4),
        (Date(), 60.2)
    ]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Weight Change")
                .font(.headline)
            Chart {
                ForEach(weightData, id: \.date) { data in
                    LineMark(
                        x: .value("Date", dateFormatter.string(from: data.date)),
                        y: .value("Weight", data.weight)
                    )
                }
            }
            
        }
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
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
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
    }
}
