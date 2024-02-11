//
//  HomeView.swift
//  Compass Companion
//
//  Created by Ricardo Herrera on 2/8/24.
//
import WidgetKit
import SwiftUI
import SwiftData
struct HomeView: View {
	@AppStorage("lastActivity") private var lastActivity: String?
	@AppStorage("lastActivityDate") private var lastActivityDate: TimeInterval?
	@Query(sort: \LogEntry.date) var entries: [LogEntry]
	@State private var path = NavigationPath()
	var body: some View {
		NavigationStack(path: $path) {
			VStack(alignment: .center, spacing: 10) {
				if !entries.isEmpty {
					let lastEntry = entries.last!
					let date = lastEntry.date.timeIntervalSince1970
					let activity = lastEntry.activity.rawValue
					let newEntry = "\(activity) on \(Date(timeIntervalSince1970: date))"
					Section("Last activity") {
						Text (lastEntry.activity.rawValue)
						Text(lastActivity ?? "Failed to show activity")
							.onAppear {
								self.lastActivity = newEntry
								self.lastActivityDate = date
								WidgetCenter.shared.reloadTimelines(ofKind: "CCWidget")
							}
						Text("Date: \(lastEntry.date.formatted())")
					}
				} else {
					Text("No entries! Go make some!")
				}
			}
			.navigationTitle("Home")
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button("Add Entry") {
						path.append(CCDestinations.add)
					}
				}
			}
			.navigationDestination(for: CCDestinations.self) {
				if $0 == .add {
					AddEntry(path: $path)
				}
			}
		}

		.toolbar {
			ToolbarItem(placement: .navigationBarTrailing) {
				Button("Add Entry") {
					path.append(CCDestinations.add)
				}
			}
		}
	}
}
