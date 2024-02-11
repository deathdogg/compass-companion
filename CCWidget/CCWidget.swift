//
//  CCWidget.swift
//  CCWidget
//
//  Created by Ricardo Herrera on 2/10/24.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
	@AppStorage("lastActivity", store: UserDefaults(suiteName: "group.compass-companion")!) private var lastActivity: String?
	@AppStorage("lastActivityDate", store: UserDefaults(suiteName: "group.compass-companion")!) private var lastActivityDate: TimeInterval?
	func placeholder(in context: Context) -> CCWEntry {
		CCWEntry(date: Date(), activity: "Park")
	}

	func getSnapshot(in context: Context, completion: @escaping (CCWEntry) -> ()) {
		let entry = CCWEntry(date: Date(timeIntervalSince1970: lastActivityDate ?? Date.now.timeIntervalSince1970), activity: lastActivity ?? "Park")
		completion(entry)
	}

	func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
		var entries: [CCWEntry] = []

		// Generate a timeline consisting of five entries an hour apart, starting from the current date.
		let entryDate = Date(timeIntervalSince1970: lastActivityDate ?? Date.now.timeIntervalSince1970)
			let entry = CCWEntry(date: entryDate, activity: lastActivity ?? "Park")
			entries.append(entry)
		let timeline = Timeline(entries: entries, policy: .atEnd)
		completion(timeline)
	}
}

struct CCWEntry: TimelineEntry {
	let date: Date
	let activity: String
}

struct CCWidgetEntryView : View {
	var entry: Provider.Entry
	var body: some View {
		VStack {
			Text("Time:")
			Text(entry.date.formatted())
			Text("Activity:")
			Text(entry.activity)
				.onAppear {
				}
		}
	}
}

struct CCWidget: Widget {
	let kind: String = "CCWidget"
	var body: some WidgetConfiguration {
		StaticConfiguration(kind: kind, provider: Provider()) {
			entry in

			if #available(iOS 17.0, *) {

				CCWidgetEntryView(entry: entry)
					.containerBackground(.fill.tertiary, for: .widget)
			} else {
				CCWidgetEntryView(entry: entry)
					.padding()
					.background()
			}
		}

		.configurationDisplayName("Compass Companion Widget")
		.description("This is an example widget.")
	}
}
