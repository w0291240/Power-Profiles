//
//  BatteryView.swift
//  Power Profiles
//
//  Created by Jesse Crocker on 2026-05-27.
//

import SwiftUI

struct BatteryView: View {
    
    @State private var screenBrightnessOnBatteryDouble: Double = 0.5
    @State private var keyBrightnessOnBatteryDouble: Double = 0.5
    @State private var darkMode: Bool = false
    @State private var TrueToneisOn: Bool = false
    @State private var HDRisOn: Bool = false
    @State private var BlueToothIsOn: Bool = false
    @State private var SiriIsOn: Bool = false
    @State private var LowPowerModeIsOn: Bool = false
    var hzArray: [String] = ["ProMotion", "60", "59.94", "50", "48", "47.95"]
    @State private var selectedRefreshRate: Int = 0
    var btblack: NSImage = #imageLiteral(resourceName: "btblack.svg")
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                // Keyboard Settings Section
                Text("Keyboard Settings")
                    .bold()
                    .font(.title)
                
                HStack {
                    Text("Keyboard Brightness")
                        .padding(5)
                    Image(systemName: "light.min")
                    Slider(value: $keyBrightnessOnBatteryDouble, in: 0...1, step: 0.1)
                    Image(systemName: "light.max")
                }
                
                Divider()
                
                // Display Settings Section
                Text("Display Settings")
                    .bold()
                    .font(.title)
                
                HStack {
                    Text("Screen Brightness")
                        .padding(5)
                    Image(systemName: "sun.min")
                    Slider(value: $screenBrightnessOnBatteryDouble, in: 0...1, step: 0.1)
                    Image(systemName: "sun.max")
                }
                
//                Divider()
                
                HStack {
                    Text("HDR Playback")
                        .padding(5)
                    Image(systemName: "sparkles.tv")
                    Toggle(isOn: $HDRisOn) {}
                }
                
//                Divider()
                
                HStack {
                    Text("TrueTone")
                        .padding(5)
                    Image(systemName: "sun.haze")
                    Toggle(isOn: $TrueToneisOn) {}
                }
                
//                Divider()
                
                HStack {
                    Text("Dark Mode")
                        .padding(5)
                    if darkMode == true {
                        Image(systemName: "lightswitch.on.fill")
                    } else {
                        Image(systemName: "lightswitch.off.fill")
                    }
                    
                    Toggle(isOn: $darkMode) {}
                }
                
//                Divider()
                
                HStack {
                    Text("Refresh Rate")
                        .padding(5)
                    Picker(selection: $selectedRefreshRate, label: Text("")) {
                        Text(hzArray[0]).tag(0)
                        Text(hzArray[1]).tag(1)
                        Text(hzArray[2]).tag(2)
                        Text(hzArray[3]).tag(3)
                        Text(hzArray[4]).tag(4)
                        Text(hzArray[5]).tag(5)
                    }
                    .pickerStyle(.segmented)
                }
                
                Divider()
                
                // System Features Section
                Text("System Features")
                    .bold()
                    .font(.title)
                
                HStack {
                    Text("Bluetooth")
//                        .padding(5)
                    Image(nsImage: btblack)
                        .resizable()
                        .frame(width: 20, height: 20)
                    Toggle(isOn: $BlueToothIsOn) {}
                }
                
//                Divider()
                
                HStack {
                    Text("Siri Suggestions")
                        .padding(5)
                    Image(systemName: "siri")
                    Toggle(isOn: $SiriIsOn) {
                        
                    }
                }
                
//                Divider()
                
                HStack {
                    Text("Low Power Mode")
                        .padding(5)
                    Image(systemName: "battery.25percent")
                        .foregroundStyle(.yellow, .black)
                    Toggle(isOn: $LowPowerModeIsOn) {
                        
                    }
                }
            }
            .padding()
            .background(.quinary.opacity(0.5), in: RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    BatteryView()
}
