//
//  Space.swift
//  Foundation Constellation
//
//  Created by Zero on 12/27/25.
//


import Foundation
import SwiftData

@Model
final class Space {
    var name: String
    var emoji: String
    var notes: String?
    var createdAt: Date

    init(
        name: String,
        emoji: String = "⭐️",
        notes: String? = nil,
        createdAt: Date = .now
    ) {
        self.name = name
        self.emoji = emoji
        self.notes = notes
        self.createdAt = createdAt
    }
}
