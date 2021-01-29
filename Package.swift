// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LoadingButton",
    platforms: [
        .iOS(.v13),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "LoadingButton",
            targets: ["LoadingButton"]),
    ],
    targets: [
        .target(
            name: "LoadingButton",
            dependencies: [])
    ]
)
