import XCTest
@testable import suas

final class ShotSessionTests: XCTestCase {
    func testShotSessionInitAndAssign() {
        let s = ShotSession()
        s.launchAngleDeg = 30
        s.initialSpeedMS = 20
        s.carryMeters = 35
        XCTAssertEqual(s.launchAngleDeg, 30)
        XCTAssertEqual(s.initialSpeedMS, 20)
        XCTAssertEqual(s.carryMeters, 35)
    }
}

