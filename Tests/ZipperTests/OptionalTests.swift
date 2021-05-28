import XCTest
import Zipper

private func lift<A>(_ value: A) -> A? {
    value
}

final class OptionalTests: XCTestCase {
    func testZip2() {
        struct Zip2 {
            let a: String
            let b: String
        }

        XCTAssertNotNil(
            zip(with: Zip2.init)(
                lift("a"),
                lift("b")
            )
        )
        XCTAssertNil(
            zip(with: Zip2.init)(
                nil,
                lift("b")
            )
        )
        XCTAssertNil(
            zip(with: Zip2.init)(
                lift("a"),
                nil
            )
        )
    }

    func testZip3() {
        struct Zip3 {
            let a: String
            let b: String
            let c: String
        }

        XCTAssertNotNil(
            zip(with: Zip3.init)(
                lift("a"),
                lift("b"),
                lift("c")
            )
        )
    }
}
