//
//  SettingsView.swift
//  Compass Companion
//
//  Created by Ricardo Herrera on 2/10/24.
//

import SwiftUI

struct SettingsView: View {
	@AppStorage("waterParkNotification") private var waterParkNotification: Bool = false
	@AppStorage("waterParkNotificationTime") private var waterParkNotificationTime = 4
	var body: some View {
		VStack {
			Form {
				Toggle("Water Park Notifications", isOn: $waterParkNotification)
				Picker("How longer after watering do you want to get notified", selection: $waterParkNotificationTime) {
					ForEach(1...6, id: \.self) {
Text(String($0))
							.tag($0)
					}
				}
			}
		}
		
	}
}

