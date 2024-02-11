//
//  ContentView.swift
//  Compass Companion
//
//  Created by Ricardo Herrera on 2/8/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
	var body: some View {
		TabView {
			HomeView()
				.tabItem { Text("Home") }
			EntriesList()
				.tabItem { Text("All Entries") }
			SettingsView()
				.tabItem { Text("Settings") }
		}
	}



}
