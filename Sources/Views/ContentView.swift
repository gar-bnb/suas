import Foundation
#if canImport(SwiftUI)
import SwiftUI

/// Minimal ContentView that navigates to capture UI.
struct ContentView: View {
    init() {}
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                NavigationLink("Open Capture") { CaptureView() }
            }
            .navigationTitle("Suas")
        }
    }
}

#Preview("ContentView") {
    ContentView()
}
#endif
