import XCTest
import Zipper

extension String: LocalizedError {}

private let checkIsNotEmpty: (String) -> Result<String, Error> = { string in
    string.isEmpty ? .failure("String must not be 'empty'") : .success(string)
}

final class ResultTests: XCTestCase {
    func testZip2() {
        struct Zip2 {
            let a: String
            let b: String
        }

        XCTAssertNoThrow(
            try zip(with: Zip2.init)(
                checkIsNotEmpty("a"),
                checkIsNotEmpty("b")
            ).get()
        )
        XCTAssertThrowsError(
            try zip(with: Zip2.init)(
                checkIsNotEmpty(""),
                checkIsNotEmpty("b")
            ).get()
        )
        XCTAssertThrowsError(
            try zip(with: Zip2.init)(
                checkIsNotEmpty("a"),
                checkIsNotEmpty("")
            ).get()
        )
    }

    func testZip3() {
        struct Zip3 {
            let a: String
            let b: String
            let c: String
        }

        XCTAssertNoThrow(
            try zip(with: Zip3.init)(
                checkIsNotEmpty("a"),
                checkIsNotEmpty("b"),
                checkIsNotEmpty("c")
            ).get()
        )
    }

    func testZip4() {
        struct Zip4 {
            let a: String
            let b: String
            let c: String
            let d: String
        }

        XCTAssertNoThrow(
            try zip(with: Zip4.init)(
                checkIsNotEmpty("a"),
                checkIsNotEmpty("b"),
                checkIsNotEmpty("c"),
                checkIsNotEmpty("d")
            ).get()
        )
    }

    func testZip5() {
        struct Zip5 {
            let a: String
            let b: String
            let c: String
            let d: String
            let e: String
        }

        XCTAssertNoThrow(
            try zip(with: Zip5.init)(
                checkIsNotEmpty("a"),
                checkIsNotEmpty("b"),
                checkIsNotEmpty("c"),
                checkIsNotEmpty("d"),
                checkIsNotEmpty("e")
            ).get()
        )
    }

    func testZip6() {
        struct Zip6 {
            let a: String
            let b: String
            let c: String
            let d: String
            let e: String
            let f: String
        }

        XCTAssertNoThrow(
            try zip(with: Zip6.init)(
                checkIsNotEmpty("a"),
                checkIsNotEmpty("b"),
                checkIsNotEmpty("c"),
                checkIsNotEmpty("d"),
                checkIsNotEmpty("e"),
                checkIsNotEmpty("f")
            ).get()
        )
    }
}
