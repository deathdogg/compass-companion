//
//  EntryDetails.swift
//  Compass Companion
//
//  Created by Ricardo Herrera on 2/8/24.
//

import SwiftUI
import SwiftData
struct EntryDetails: View {
	@State var entry: LogEntry
	@State var isEditing = false
	var body: some View {
		VStack {
			Section("Info") {
				if isEditing {
					Picker("Activity", selection: $entry.activity) {
						ForEach(GDActivity.allCases, id: \.self) {
							Text($0.rawValue)
								.tag($0)
						}
						.pickerStyle(.wheel)
					}
					DatePicker("Date", selection: $entry.date)
				} else {
					Text(entry.activity.rawValue)
					Text(entry.date.formatted())
				}
			}
			Section("Notes") {
				if isEditing {
					TextField("Notes", text: $entry.notes)
				} else {
					Text(entry.notes)
				}
			}
		}
		.toolbar {
			ToolbarItem(placement: .navigationBarTrailing) {
				Button(isEditing ? "Done" : "Edit") {
					isEditing.toggle()
				}
			}
		}
		.navigationTitle("Details")
	}
}
