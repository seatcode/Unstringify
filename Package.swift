// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Unstringify",
    targets: [
        .target(
            name: "unstringify",
            dependencies: ["Unstringified", "UnstringifyFramework"]),
        .target(
            name: "Unstringified",
            dependencies: []),
        .target(
            name: "findStrings",
            dependencies: ["UnstringifyFramework"]),
        .target(
            name: "findAndroidStrings",
            dependencies: ["UnstringifyFramework"]),
        .target(
            name: "UnstringifyFramework",
            dependencies: []),
        .target(
            name: "CLITestFramework",
            dependencies: []),
        .testTarget(
            name: "UnstringifyTests",
            dependencies: ["CLITestFramework", "unstringify"]),
        .testTarget(
            name: "UnstringifiedTests",
            dependencies: ["Unstringified"]),
        .testTarget(
            name: "FindStringsTests",
            dependencies: ["CLITestFramework", "findStrings"]),
        .testTarget(
            name: "FindAndroidStringsTests",
            dependencies: ["CLITestFramework", "findAndroidStrings"]),
        .testTarget(
            name: "UnstringifyFrameworkTests",
            dependencies: ["UnstringifyFramework"]),
    ]
)
