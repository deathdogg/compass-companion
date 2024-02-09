//
//  AddEntry.swift
//  Compass Companion
//
//  Created by Ricardo Herrera on 2/8/24.
//

import SwiftUI
import SwiftData
struct AddEntry: View {
	@Environment(\.modelContext) private var moc
	@Binding var path: NavigationPath
	@State private var entry = LogEntry(activity: .park, date: .now)
	var body: some View {
		VStack {
			Form {
				Picker("Activity", selection: $entry.activity) {
					ForEach(GDActivity.allCases, id: \.self) {
						Text($0.rawValue)
							.tag($0)
					}
				}
				.pickerStyle(.wheel)
			DatePicker("Date", selection: $entry.date)
				TextField("Notes", text: $entry.notes)
			}
		}
		.navigationTitle("Add Entry")
		.toolbar {
			ToolbarItem(placement: .navigationBarTrailing) {
				Button("Save") {
					moc.insert(entry)
					try! moc.save()
					path.removeLast()
				}
			}
		}
	}
}
