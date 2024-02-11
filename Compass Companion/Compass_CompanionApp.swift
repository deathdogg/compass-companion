//
//  Compass_CompanionApp.swift
//  Compass Companion
//
//  Created by Ricardo Herrera on 2/8/24.
//

import SwiftUI
import SwiftData

@main
struct Compass_CompanionApp: App {
	var sharedModelContainer: ModelContainer = {
		let schema = Schema([
			LogEntry.self,
		])
		let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

		do {
			return try ModelContainer(for: schema, configurations: [modelConfiguration])
		} catch {
			fatalError("Could not create ModelContainer: \(error)")
		}
	}()

	var body: some Scene {
		WindowGroup {
			ContentView()
				.defaultAppStorage(UserDefaults(suiteName: "group.compass-companion")!)
		}
		.modelContainer(sharedModelContainer)
	}
}
