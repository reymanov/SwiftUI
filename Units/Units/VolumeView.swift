import SwiftUI

struct VolumeView: View {
    @State var input = 0
    @State var inputUnit = "Liters"
    @State var outputUnit = "Gallons"
    
    let units = ["Mililiters", "Liters", "Cups", "Pints", "Gallons"]
    
    var body: some View {
        Form {
            Section {
                TextField("Amount", value: $input, format: .number )
            } header: {
                Text("Amount to convert")
            }
            
            Section {
                Picker("Convert from", selection: $inputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                Picker("Convert to", selection: $outputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
            }
            
            Section {
                Text("...")
            }header: {
                Text("Result")
            }
        }.navigationTitle("Volume")
    }
}

struct VolumeView_Previews: PreviewProvider {
    static var previews: some View {
        VolumeView()
    }
}
