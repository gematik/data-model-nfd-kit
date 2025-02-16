// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataModel-NFD",
    platforms: [
      .macOS(.v10_12), .iOS(.v8), .tvOS(.v9), .watchOS(.v3)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
              name: "NFD_V1_3",
              targets: ["NFD_V1_3"]),
        .library(
              name: "NFD_V1_4",
              targets: ["NFD_V1_4"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/spilikin/SwiftXMLTools.git", .exact("0.5.1")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMinor(from: "8.0.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
                name: "NFD_V1_3",
                dependencies: ["XMLTools"]),
        .target(
                name: "NFD_V1_4",
                dependencies: ["XMLTools"]),
        .testTarget(
                name: "NFD_V1_3Tests",
                dependencies: ["NFD_V1_3", "Nimble"]),
    ],
    swiftLanguageVersions: [.v5]
)
