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
            VStack {
                
                Text("Keyboard Settings")
                    .bold()
                    .font(.title)
                //Key Brightness
                HStack {
                    Text("Keyboard Brightness")
                    Image(systemName: "light.min")
                    Slider(value: $keyBrightnessOnBatteryDouble)
                    Image(systemName: "light.max")
                }
                .padding(10)
                .padding(.leading, 15)
                .padding(.trailing, 15)
                
            }
            .background(.quinary, in: RoundedRectangle(cornerRadius: 10))
                Divider()
                .padding(.leading, 15)
                .padding(.trailing, 15)
            VStack{
                //DISPLAY RELATED CONTROLS
                //Screen Brightness
                Text("Display Settings")
                    .bold()
                    .font(.title)
                
                
                HStack {
                    Text("Screen Brightness")
                    Image(systemName: "sun.min")
                    Slider(value: $screenBrightnessOnBatteryDouble)
                    Image(systemName: "sun.max")
                        .padding(.leading, 15)
                        .padding(.trailing, 15)
                }
                .padding(10)
                .padding(.leading, 15)
                .padding(.trailing, 15)
                Divider()
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
                
                
                //HDR
                HStack {
                    Text("HDR Playback")
                    Image(systemName: "sparkles.tv")
                    Toggle(isOn: $HDRisOn) {
                    }
                }
                .padding(10)
                Divider()
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
                
                //TrueTone
                HStack {
                    Text("TrueTone")
                    Image(systemName: "sun.haze")
                    Toggle(isOn: $TrueToneisOn) {
                    }
                }
                .padding(10)
                Divider()
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
                
                //DarkMode
                HStack {
                    Text("Dark Mode")
                    if(darkMode == true) {
                        Image(systemName: "lightswitch.on.fill")
                    } else {
                        Image(systemName: "lightswitch.off.fill")
                    }
                    
                    Toggle(isOn: $darkMode) {
                    }
                }
                
                .padding(10)
                Divider()
                
                HStack {
                    Picker(selection: $selectedRefreshRate, label: Text("Refresh Rate")) {
                        Text(hzArray[0]).tag(0)
                        Text(hzArray[1]).tag(1)
                        Text(hzArray[2]).tag(2)
                        Text(hzArray[3]).tag(3)
                        Text(hzArray[4]).tag(4)
                        Text(hzArray[5]).tag(5)
                    }
                    .pickerStyle(.menu)
                }
                
                .padding(10)
            }
            .background(.quinary, in: RoundedRectangle(cornerRadius: 10))
                Divider()
            VStack{
                HStack{
                    Text("Bluetooth")
                    Image(nsImage:btblack)
                    Toggle(isOn: $BlueToothIsOn){
                    }
                }
                .padding(10)
                
                HStack{
                    Text("Siri Suggestions")
                    Image(systemName: "siri")
                    Toggle(isOn: $SiriIsOn){}
                }
                .padding(10)
                
                
                HStack{
                    Text("Low Power Mode")
                    Image(systemName: "battery.25percent")
                        .foregroundStyle(.yellow, .black)
                    
                    Toggle(isOn: $LowPowerModeIsOn) {
                        
                    }
                }
                .padding(10)
            }}}
    }


#Preview {
    BatteryView()
}
