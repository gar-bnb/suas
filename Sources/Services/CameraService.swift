import Foundation
#if canImport(AVFoundation)
import AVFoundation
#endif

/// Service responsible for managing the camera capture lifecycle.
///
/// This scaffold purposely avoids heavy configuration. It establishes a minimal
/// async API appropriate for iOS 17 and can be extended to configure 240 fps,
/// depth, and sample buffer outputs in later iterations.
actor CameraService {

    enum CameraError: Error {
        case unauthorized
        case configurationFailed
        case runtimeFailure
    }

    #if canImport(AVFoundation)
    private let session = AVCaptureSession()
    #endif

    /// Creates a new `CameraService` instance.
    init() {}

    /// Requests video capture permission from the user.
    /// - Returns: `true` if authorization is granted, `false` otherwise.
    func requestAuthorization() async -> Bool {
        #if canImport(AVFoundation)
        return await withCheckedContinuation { cont in
            AVCaptureDevice.requestAccess(for: .video) { granted in
                cont.resume(returning: granted)
            }
        }
        #else
        return false
        #endif
    }

    /// Starts the capture session after ensuring authorization.
    /// - Throws: `CameraError.unauthorized` if permission is not granted.
    func start() async throws {
        #if canImport(AVFoundation)
        guard await isAuthorized() else { throw CameraError.unauthorized }
        // Minimal no-op configuration; real pipeline to be added later.
        if !session.isRunning {
            session.startRunning()
        }
        #endif
    }

    /// Stops the capture session if running.
    func stop() async {
        #if canImport(AVFoundation)
        if session.isRunning {
            session.stopRunning()
        }
        #endif
    }

    /// Indicates whether the capture session is currently running.
    /// - Returns: `true` if running; `false` otherwise.
    func isRunning() async -> Bool {
        #if canImport(AVFoundation)
        return session.isRunning
        #else
        return false
        #endif
    }

    /// Checks current authorization status for video capture.
    /// - Returns: `true` if authorized, `false` otherwise.
    func isAuthorized() async -> Bool {
        #if canImport(AVFoundation)
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized: return true
        case .notDetermined: return await requestAuthorization()
        default: return false
        }
        #else
        return false
        #endif
    }
}
