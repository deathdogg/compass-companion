//
//  Item.swift
//  Compass Companion
//
//  Created by Ricardo Herrera on 2/8/24.
//

import Foundation
import SwiftData

@Model
final class LogEntry {
	var activity: GDActivity
	var date: Date
	var notes: String
	init(activity: GDActivity, date: Date, notes: String = "") {
		self.activity = activity
		self.date = date
		self.notes = notes
	}
}
