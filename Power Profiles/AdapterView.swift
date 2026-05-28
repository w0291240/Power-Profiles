//
//  AdapterView.swift
//  Power Profiles
//
//  Created by Jesse Crocker on 2026-05-27.
//

import SwiftUI

struct AdapterView: View {
    
    @State private var screenBrightnessOnAdapterDouble: Double = 0.5
    @State private var keyBrightnessOnAdapterDouble: Double = 0.5
    @State private var darkMode: Bool = false
    
    var body: some View {
        VStack {
            
            //Screen Brightness
            HStack {
                Text("Screen Brightness")
                Image(systemName: "sun.min")
                Slider(value: $screenBrightnessOnAdapterDouble)
                Image(systemName: "sun.max")
            }
            .padding(10)
            
            //Key Brightness
            HStack {
                Text("Keyboard Brightness")
                Image(systemName: "light.min")
                Slider(value: $keyBrightnessOnAdapterDouble)
                Image(systemName: "light.max")
            }
            .padding(10)
            Divider()
            
            //HDR
            HStack {
                Text("HDR Playback")
                Image(systemName: "sparkles.tv")
                Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                }
            }
            .padding(10)
            
            
            //TrueTone
            HStack {
                Text("TrueTone")
                Image(systemName: "sun.haze")
                Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                }
            }
            .padding(10)
            
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
                
            }
            
        }
    }


#Preview {
    AdapterView()
}
