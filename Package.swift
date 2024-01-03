// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OrzUIKit",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "Core", targets: ["Core"]),
        .library(name: "Debug", targets: ["Debug"])
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.6.0")
    ],
    targets: [
        .target(
            name: "Core",
            dependencies: ["SnapKit"],
            path: "Classes/Core",
            resources: [
                .process("Assets")
            ]
        ),
        .target(
            name: "Debug",
            dependencies: ["Core"],
            path: "Classes/Debug"
        )
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
