import SwiftUI

struct TimeView: View {
    @State var input = 0
    @State var inputUnit = "Minutes"
    @State var outputUnit = "Hours"
    
    let units = ["Seconds", "Minutes", "Hours", "Days"]
    
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
        }.navigationTitle("Time")
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
