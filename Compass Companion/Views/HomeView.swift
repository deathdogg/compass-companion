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
	@Query(sort: \LogEntry.date) var entries: [LogEntry]
	@State private var path = NavigationPath()
	var body: some View {
		NavigationStack(path: $path) {
			VStack(alignment: .center, spacing: 10) {
				if !entries.isEmpty {
					let lastEntry = entries.last!
					Section("Last activity") {
						Text (lastEntry.activity.rawValue)
							.onAppear {
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
				ToolbarItem(placement: .topBarTrailing) {
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
