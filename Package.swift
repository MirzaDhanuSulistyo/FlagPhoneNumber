// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "FlagPhoneNumber",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "FlagPhoneNumber",
            targets: ["FlagPhoneNumber"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "FlagPhoneNumber",
            dependencies: [],
            path: "Sources",
            resources: [.process("Resources")],
            exclude: ["Info.plist"]
        )
    ]
)
