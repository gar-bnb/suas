import Foundation
#if canImport(SwiftUI)
import SwiftUI

/// Placeholder history screen.
struct HistoryView: View {
    @StateObject private var viewModel = HistoryViewModel()

    init() {}
    var body: some View {
        List(viewModel.shots.indices, id: \.self) { idx in
            Text("Shot #\(idx + 1)")
        }
        .navigationTitle("History")
    }
}

#Preview("HistoryView") {
    HistoryView()
}
#endif
