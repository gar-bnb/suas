import Foundation

/// Very small logging helper to keep output consistent during development.
enum Logger {
    static func log(_ message: @autoclosure () -> String, file: String = #fileID, line: Int = #line) {
        #if DEBUG
        let ts = ISO8601DateFormatter().string(from: Date())
        print("[\(ts)] [\(file):\(line)] \(message())")
        #endif
    }
}

