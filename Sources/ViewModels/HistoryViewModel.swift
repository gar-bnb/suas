import Foundation
import Combine

/// Simple scaffold view model for listing stored shots.
@MainActor
final class HistoryViewModel: ObservableObject {
    @Published private(set) var shots: [ShotSession] = []

    init() {}
}
