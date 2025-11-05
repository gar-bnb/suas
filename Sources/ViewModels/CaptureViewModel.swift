import Foundation
import Combine

/// View model coordinating capture lifecycle and shot computation.
@MainActor
final class CaptureViewModel: ObservableObject {
    @Published private(set) var isRunning: Bool = false
    @Published private(set) var lastShot: ShotSession?

    private let cameraService: CameraService

    /// Creates a new `CaptureViewModel`.
    /// - Parameter cameraService: Service for camera control; defaults to a new instance.
    init(cameraService: CameraService = CameraService()) {
        self.cameraService = cameraService
    }

    /// Requests permission and starts the camera session.
    func startCapture() async {
        do {
            try await cameraService.start()
            isRunning = await cameraService.isRunning()
        } catch {
            isRunning = false
        }
    }

    /// Stops the camera session.
    func stopCapture() async {
        await cameraService.stop()
        isRunning = await cameraService.isRunning()
    }

    /// Computes and stores a synthetic shot result for demonstration.
    /// - Parameters:
    ///   - launchAngleDegrees: Launch angle in degrees.
    ///   - ballSpeedMetersPerSecond: Ball speed in m/s.
    func recordSyntheticShot(
        launchAngleDegrees: Double,
        ballSpeedMetersPerSecond: Double
    ) {
        let carry = PhysicsEngine.carry(
            initialSpeedMS: ballSpeedMetersPerSecond,
            angleDeg: launchAngleDegrees
        )
        let shot = ShotSession()
        shot.createdAt = Date()
        shot.launchAngleDeg = launchAngleDegrees
        shot.initialSpeedMS = ballSpeedMetersPerSecond
        shot.carryMeters = carry
        lastShot = shot
    }
}
