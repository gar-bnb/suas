import Foundation
import SwiftData
import Darwin // for math functions like sin, cos, pow if used elsewhere

/// SwiftData model representing a single captured short‑game shot.
@Model
final class ShotSession {
    // Stored properties for SwiftData models should avoid using inline default values
    // that rely on synthesized storage. Provide values in an initializer instead.
    var id: UUID
    var createdAt: Date
    var launchAngleDeg: Double
    var initialSpeedMS: Double
    var carryMeters: Double

    /// Designated initializer required by `@Model` when avoiding inline defaults.
    init(
        id: UUID = UUID(),
        createdAt: Date = Date(),
        launchAngleDeg: Double = 0,
        initialSpeedMS: Double = 0,
        carryMeters: Double = 0
    ) {
        self.id = id
        self.createdAt = createdAt
        self.launchAngleDeg = launchAngleDeg
        self.initialSpeedMS = initialSpeedMS
        self.carryMeters = carryMeters
    }
}
