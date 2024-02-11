//
//  AddEntry.swift
//  Compass Companion
//
//  Created by Ricardo Herrera on 2/8/24.
//
import UserNotifications
import SwiftUI
import SwiftData
struct AddEntry: View {
	@AppStorage("waterParkNotification") private var waterParkNotification: Bool = false
	@AppStorage("waterParkNotificationTime") private var waterParkNotificationTime = 4
	@AppStorage("allowNotifications") private var allowNotifications: Bool?
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
					if allowNotifications == true {
						if entry.activity == .water && waterParkNotification == true {
							print("Scheduling Notification")
							let un = UNUserNotificationCenter.current()
							let content = UNMutableNotificationContent()
							content.title = "Time to park"
							content.body = "It's time to park your dog!"
							content.sound = UNNotificationSound.default
							let trigger = UNTimeIntervalNotificationTrigger(timeInterval: (60*60)*Double(waterParkNotificationTime), repeats: false)
							let request = UNNotificationRequest(identifier: "\(entry.date.formatted())", content: content, trigger: trigger)
							un.add(request) {
								error in
								if let e = error {
									print(e)
								}
							}
						}
					}
					path.removeLast()
				}
			}
		}
	}
}
