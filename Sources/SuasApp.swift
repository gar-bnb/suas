import SwiftUI
import SwiftData

@main
struct SuasApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ShotSession.self)
    }
}

