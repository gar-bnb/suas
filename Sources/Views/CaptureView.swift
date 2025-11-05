import Foundation
#if canImport(SwiftUI)
import SwiftUI

/// Simple capture screen scaffold with start/stop and a demo shot action.
struct CaptureView: View {
    @StateObject private var viewModel = CaptureViewModel()

    init() {}

    var body: some View {
        VStack(spacing: 16) {
            Text("Suas Capture")
                .font(.title2)

            HStack(spacing: 12) {
                Button(viewModel.isRunning ? "Stop" : "Start") {
                    Task {
                        if viewModel.isRunning {
                            await viewModel.stopCapture()
                        } else {
                            await viewModel.startCapture()
                        }
                    }
                }

                Button("Demo Shot") {
                    // Example: 35° launch, 22 m/s (~49 mph)
                    viewModel.recordSyntheticShot(launchAngleDegrees: 35, ballSpeedMetersPerSecond: 22)
                }
            }

            if let shot = viewModel.lastShot {
                ResultCardView(shot: shot)
                    .padding(.top, 8)
            } else {
                Text("No shots yet")
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding()
    }
}

#Preview("CaptureView") {
    CaptureView()
}
#endif
