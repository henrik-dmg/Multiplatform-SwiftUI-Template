// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyAppKit",
    platforms: [
        .macOS(.v13),
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MyAppKit",
            targets: ["MyAppKit"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Business logic and tests
        .target(
            name: "MyAppFoundation",
            dependencies: []
        ),
        .testTarget(
            name: "MyAppFoundationTests",
            dependencies: ["MyAppFoundation"]
        ),
        // UI code and tests
        .target(
            name: "MyAppUI",
            dependencies: ["MyAppFoundation"]
        ),
        .testTarget(
            name: "MyAppUITests",
            dependencies: ["MyAppUI"]
        ),
        // Umbrella module
        .target(
            name: "MyAppKit",
            dependencies: [
                "MyAppFoundation",
                "MyAppUI"
            ]
        ),
    ]
)
