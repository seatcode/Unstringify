// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Unstringify",
    targets: [
        .target(
            name: "unstringify",
            dependencies: ["Unstringified"]),
        .target(
            name: "Unstringified",
            dependencies: []),
        .testTarget(
            name: "UnstringifyTests",
            dependencies: ["unstringify"]),
        .testTarget(
            name: "UnstringifiedTests",
            dependencies: ["Unstringified"]),
    ]
)
