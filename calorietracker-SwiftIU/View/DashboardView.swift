import SwiftUI
import SwiftUICharts
import Charts
struct DashboardView: View {
    @ObservedObject var viewModel: DiaryViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                    
                    
                    EnergyChart()
                    EnergyChart()
                    MacroChartView(viewModel: viewModel)
                
                    
                }
                .containerShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .fixedSize(horizontal: false, vertical: true)
                    .padding([.horizontal, .bottom], 16)
                    .frame(maxWidth: 1200)
                
            }
            .navigationBarTitle("Dashboard")
        }
    }
}



struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(viewModel: DiaryViewModel())
    }
}
