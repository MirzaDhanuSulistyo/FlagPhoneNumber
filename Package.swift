// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "FlagPhoneNumber",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "FlagPhoneNumber",
            targets: ["FlagPhoneNumber"]
        ),
    ],
    targets: [
        .target(
            name: "FlagPhoneNumber",
            path: "FlagPhoneNumber/Sources"
        )
    ]
)
