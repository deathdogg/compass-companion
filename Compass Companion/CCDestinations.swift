//
//  CCDestinations.swift
//  Compass Companion
//
//  Created by Ricardo Herrera on 2/8/24.
//

import Foundation
enum CCDestinations: Hashable {
	case add
	case edit(LogEntry)
	case view(LogEntry)
}
