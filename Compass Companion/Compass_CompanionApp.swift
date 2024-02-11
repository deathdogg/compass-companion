//
//  Compass_CompanionApp.swift
//  Compass Companion
//
//  Created by Ricardo Herrera on 2/8/24.
//
import UserNotifications
import SwiftUI
import SwiftData

@main
struct Compass_CompanionApp: App {
	@AppStorage("allowNotifications", store: UserDefaults(suiteName: "group.compass-companion")!) private var allowNotifications: Bool?
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
				.onAppear {
					if allowNotifications == nil {
						let un = UNUserNotificationCenter.current()
						un.requestAuthorization(options: [.sound, .alert]) {
							s, _ in
							if s {
								allowNotifications = true
							} else {
								allowNotifications = false
							}
						}
					}
					let un = UNUserNotificationCenter.current()
					un.getNotificationSettings() {
						if $0.authorizationStatus == .authorized {
							allowNotifications = true
						}
					}
				}
				.defaultAppStorage(UserDefaults(suiteName: "group.compass-companion")!)
		}
		.modelContainer(sharedModelContainer)
	}
}
