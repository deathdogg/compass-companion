//
//  DogActivities.swift
//  Compass Companion
//
//  Created by Ricardo Herrera on 2/8/24.
//

import Foundation
enum GDActivity: String, CaseIterable, Codable {
	case feed = "Feeding"
	case grooming = "Grooming"
	case medication = "Medication"
	case park = "Park"
	case treats = "Treats"
	case walk = "Walk"
	case water = "Water"
}
