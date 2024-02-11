//
//  CCWidget.swift
//  CCWidget
//
//  Created by Ricardo Herrera on 2/10/24.
//
import SwiftData
import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
	@MainActor
	private func getLogEntries() -> [LogEntry] {
		var activities: [LogEntry] = []
		var activitiesDescriptor = FetchDescriptor<LogEntry>(sortBy: [SortDescriptor(\LogEntry.date)])
		guard let moc = try? ModelContainer(for: LogEntry.self) else {
			return activities
		}
		do {
			activities = try moc.mainContext.fetch(activitiesDescriptor)
		} catch {
			print(error)
		}
		return activities
	}
	func placeholder(in context: Context) -> CCWEntry {
		CCWEntry(date: Date(), activities:
		[
			LogEntry(activity: .park, date: .now)
		])
	}
@MainActor
	func getSnapshot(in context: Context, completion: @escaping (CCWEntry) -> ()) {

		let entry = Entry(date: .now, activities: self.getLogEntries())
		completion(entry)
	}
@MainActor
	func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
		var entries: [CCWEntry] = []

		// Generate a timeline consisting of five entries an hour apart, starting from the current date.
		let entry = CCWEntry(date: .now, activities: self.getLogEntries())
			entries.append(entry)
		let timeline = Timeline(entries: entries, policy: .atEnd)
		completion(timeline)
	}
}

struct CCWEntry: TimelineEntry {
	let date: Date
	let activities: [LogEntry]
}

struct CCWidgetEntryView : View {
	var entry: Provider.Entry
	var lastActivity: LogEntry {
		entry.activities.last ?? LogEntry(activity: .park, date: 	.now)
	}
	var body: some View {
		VStack {
			Text("Time:")
			Text(lastActivity.date.formatted())
			Text("Activity:")
			Text(lastActivity.activity.rawValue)
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
