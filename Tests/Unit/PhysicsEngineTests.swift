import XCTest
@testable import suas

final class PhysicsEngineTests: XCTestCase {
    func testCarryPositive() {
        let carry = PhysicsEngine.carry(initialSpeedMS: 20, angleDeg: 30)
        XCTAssertGreaterThan(carry, 0)
    }
}
