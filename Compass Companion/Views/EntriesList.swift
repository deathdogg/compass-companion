//
//  EntriesList.swift
//  Compass Companion
//
//  Created by Ricardo Herrera on 2/8/24.
//

import SwiftUI
import SwiftData
struct EntriesList: View {
	@State private var path = NavigationPath()
	@Query(sort: \LogEntry.date) private var entries: [LogEntry]
	var body: some View {
		NavigationStack(path: $path) {
			VStack {
				List(entries) {
					entry in
					NavigationLink(value: CCDestinations.view(entry)) {
						Text(entry.activity.rawValue)
						Text(entry.date.formatted())
				}
					.accessibilityActions {
						Button("Edit") {
							path.append(CCDestinations.edit(entry))
						}
					}
					.onLongPressGesture {
						path.append(CCDestinations.edit(entry))
					}
				}
			}
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					NavigationLink("Add Entry", value: CCDestinations.add)
				}
			}
			.navigationTitle("All Entries")
			.navigationDestination(for: CCDestinations.self) {
				switch $0 {
				case .add:
					AddEntry(path: $path)
				case .edit(let e):
					EntryDetails(entry: e, isEditing: true)
					
				case .view(let e):
					EntryDetails(entry: e)
				}
			}
		}
	}
}
