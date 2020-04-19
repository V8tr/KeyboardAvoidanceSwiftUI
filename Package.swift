// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KeyboardAvoidance",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "KeyboardAvoidance",
            targets: ["KeyboardAvoidance"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "KeyboardAvoidance",
            dependencies: []),
        .testTarget(
            name: "KeyboardAvoidanceTests",
            dependencies: ["KeyboardAvoidance"]),
    ]
)
