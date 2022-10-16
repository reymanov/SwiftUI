import SwiftUI

struct ConverterView: View {
    @State var input = 0.0
    @State var selectedUnits = 0
    @State var inputUnit: Dimension = UnitLength.meters
    @State var outputUnit: Dimension = UnitLength.kilometers
    @FocusState var inputIsFocused: Bool
    
    let conversions: [String] = ["Distance", "Mass", "Temperature", "Time", "Volume"]
    let unitTypes = [
        [UnitLength.feet, UnitLength.kilometers, UnitLength.meters, UnitLength.miles, UnitLength.yards],
        [UnitMass.grams, UnitMass.kilograms, UnitMass.ounces, UnitMass.pounds],
        [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin],
        [UnitDuration.seconds, UnitDuration.minutes, UnitDuration.hours],
        [UnitVolume.cubicCentimeters, UnitVolume.cubicDecimeters, UnitVolume.cubicMeters, UnitVolume.cubicFeet, UnitVolume.cups]
    ]
    
    let formatter: MeasurementFormatter
    
    var result: String {
        let inputMeasurement = Measurement(value: input, unit: inputUnit);
        let outputMeasurement = inputMeasurement.converted(to: outputUnit)
        
        return formatter.string(from: outputMeasurement)
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Conversion type", selection: $selectedUnits) {
                        ForEach(0..<conversions.count, id: \.self) {
                            Text(conversions[$0])
                        }
                    }.pickerStyle(.menu)
                }
                
                Section {
                    TextField("Length", value: $input, format: .number )
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                    
                } header: {
                    Text("Amount to convert")
                }
            
                
                Section {
                    Picker("Convert from", selection: $inputUnit) {
                        ForEach(unitTypes[selectedUnits], id: \.self) {
                            Text(formatter.string(from: $0).capitalized)
                        }
                    }
                    Picker("Convert to", selection: $outputUnit) {
                        ForEach(unitTypes[selectedUnits], id: \.self) {
                            Text(formatter.string(from: $0).capitalized)
                        }
                    }
                }
                
                Section {
                    Text(result)
                }header: {
                    Text("Result")
                }
            }
            .navigationTitle("Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
            .onChange(of: selectedUnits) { newSelection in
                let units = unitTypes[newSelection]
                inputUnit = units[0]
                outputUnit = units[1]
            }
        }
    }
    
    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConverterView()
    }
}
