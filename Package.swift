// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Zipper",
    products: [
        .library(name: "Zipper", targets: ["Zipper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/shibapm/Komondor.git", from: "1.0.6"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat.git", from: "0.48.3"),
    ],
    targets: [
        .target(name: "Zipper"),
        .testTarget(name: "ZipperTests", dependencies: ["Zipper"]),
    ],
    swiftLanguageVersions: [.v5]
)

#if canImport(PackageConfig)
    import PackageConfig

    let paths = [
        "./Package.swift",
        "./Sources",
        "./Tests",
    ].joined(separator: " ")

    let config = PackageConfiguration([
        "komondor": [
            "pre-push": "swift test",
            "pre-commit": [
                "swift run swiftformat \(paths)",
                "git add \(paths)",
            ],
        ],
    ]).write()
#endif
