import SwiftUI
import Charts

struct Macros: Identifiable {
    var id = UUID()
    let date: Date
    let type: String
    let value: Double
}

struct EnergyChart: View {
    @ObservedObject var viewModel: DiaryViewModel

    func macrosData() -> [Macros] {
            var data: [Macros] = []
            for entry in viewModel.diaryEntries {
                data.append(Macros(date: entry.date, type: "Fat", value: Double(entry.dailyFat)))
                data.append(Macros(date: entry.date, type: "Protein", value: Double(entry.dailyProtein)))
                data.append(Macros(date: entry.date, type: "Carbs", value: Double(entry.dailyCarbs)))
            }
            return data
        }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter
    }()

    var body: some View {
            VStack(alignment: .leading) {
                Label("Energy History (kcal)", systemImage: "bolt.fill")
                let data = macrosData()
                Chart(data) { macro in
                    BarMark(
                        x: .value("Date", dateFormatter.string(from: macro.date)),
                        y: .value("Macro", macro.value)
                    )
                    .foregroundStyle(by: .value("Type", macro.type))
                    .opacity(0.5)
                }
                .frame(minWidth: 1)
            }
            .padding(10)
            .background(Color.white)
        }
    
    
}

struct EnergyChart_Previews: PreviewProvider {
    static var previews: some View {
        EnergyChart(viewModel: DiaryViewModel())
    }
}
