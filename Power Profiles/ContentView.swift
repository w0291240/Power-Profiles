//
//  ContentView.swift
//  Power Profiles
//
//  Created by Jesse Crocker on 2026-05-26.
//

import SwiftUI
import IOKit.ps

struct ContentView: View {
    @State private var selectedTab: Int = 1
    @State private var screenBrightnessDouble: Double = 0.5
    @State private var darkMode: Bool = false

    var body: some View {
        TabView(selection: $selectedTab) {
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Label("On-Battery Profile", systemImage: "battery.50")
                        .font(.largeTitle)
                    Divider()
                    BatteryView()
                }
                .padding(15)
            }
            .tabItem {
                Text("Battery")
            }
            .tag(1)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Label("On-Adapter Profile", systemImage: "powerplug")
                        .font(.largeTitle)
                    AdapterView()
                }
                .padding(15)
            }
            .tabItem {
                Text("Adapter")
            }
            .tag(2)
        }
    }
}

func isMacOnPowerAdapter() -> Bool {
    let powerSourceInfo = IOPSCopyPowerSourcesInfo().takeRetainedValue()
    let powerSourcesList = IOPSCopyPowerSourcesList(powerSourceInfo).takeRetainedValue() as NSArray

    for item in powerSourcesList {
        // Each element is a CFTypeRef identifying a power source
        guard let powerSource = item as CFTypeRef? else { continue }

        if let description = IOPSGetPowerSourceDescription(powerSourceInfo, powerSource)?.takeUnretainedValue() as? [String: Any] {
            if let powerState = description[kIOPSPowerSourceStateKey as String] as? String,
               powerState == (kIOPSACPowerValue as String) {
                return true
            }
        }
    }

    return false
}

#Preview {
    ContentView()
}
