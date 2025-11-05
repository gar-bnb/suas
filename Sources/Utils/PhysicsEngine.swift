import Darwin

struct PhysicsEngine {
    /// Returns carry (m) from speed (m/s) and launch angle (deg)
    static func carry(initialSpeedMS: Double, angleDeg: Double, g: Double = 9.80665, k: Double = 1.0) -> Double {
        let theta = angleDeg * .pi / 180
        return (pow(initialSpeedMS, 2) * sin(2 * theta)) / g * k
    }
}

