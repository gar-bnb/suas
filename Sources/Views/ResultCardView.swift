import Foundation
#if canImport(SwiftUI)
import SwiftUI

/// Displays the key results from a `ShotSession`.
struct ResultCardView: View {
    let shot: ShotSession

    init(shot: ShotSession) {
        self.shot = shot
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Result")
                .font(.headline)

            HStack {
                Label(value(shot.launchAngleDeg, suffix: "°"), systemImage: "angle")
                Spacer()
                Label(value(shot.initialSpeedMS, suffix: " m/s"), systemImage: "speedometer")
                Spacer()
                Label(value(shot.carryMeters, suffix: " m"), systemImage: "figure.golf")
            }
            .font(.subheadline)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
    }

    private func value(_ v: Double, suffix: String) -> String {
        String(format: "%.1f%@", v, suffix)
    }
}

#Preview("ResultCardView") {
    let s = ShotSession()
    s.launchAngleDeg = 35
    s.initialSpeedMS = 22
    s.carryMeters = 40
    return ResultCardView(shot: s)
    .padding()
}
#endif
