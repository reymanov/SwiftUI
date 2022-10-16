import SwiftUI

struct TemperatureView: View {
    @State var input = 0
    @State var inputUnit = "Celsius"
    @State var outputUnit = "Fahrenheit"
    
    let units = ["Celsius", "Fahrenheit"]
    
    
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
        }.navigationTitle("Temperature")
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView()
        
    }
}
