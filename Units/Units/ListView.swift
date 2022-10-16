import SwiftUI

struct ListView: View {
   
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: LengthView(), label: {
                    Label("Length", systemImage: "ruler")
                })
                NavigationLink(destination: TemperatureView(), label: {
                    Label("Temperature", systemImage: "thermometer")
                })
                NavigationLink(destination: TimeView(), label: {
                    Label("Time", systemImage: "clock")
                })
                NavigationLink(destination: VolumeView(), label: {
                    Label("Volume", systemImage: "light.panel")
                })
            }.navigationTitle("Unit conversion")
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
