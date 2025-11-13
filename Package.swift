// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WCDBManager",
    platforms: [.iOS(.v13), .macOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "WCDBManager",
            targets: ["WCDBManager"]
        ),
    ],
    dependencies: [.package(url: "https://github.com/Tencent/wcdb.git", .upToNextMajor(from: "2.1.15"))],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "WCDBManager",
            dependencies: [.product(name: "WCDBSwift", package: "wcdb")]
        ),
        .testTarget(
            name: "WCDBManagerTests",
            dependencies: ["WCDBManager"]
        ),
    ]
)
