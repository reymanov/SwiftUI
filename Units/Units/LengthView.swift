import SwiftUI

struct LengthView: View {
    @State var input = 0
    @State var inputUnit = "Meters"
    @State var outputUnit = "Kilometers"
    
    let units = ["Feet", "Meters", "Yards", "Kilometers", "Miles", "Yards"]
    
    
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
                Text("Output")
            }header: {
                Text("Result")
            }
        }.navigationTitle("Length")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LengthView()
    }
}
