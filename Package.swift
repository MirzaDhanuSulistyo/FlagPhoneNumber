// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "FlagPhoneNumber",
    platforms: [
        .iOS(.v11),
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
            path: "Sources",  // Path to your .h files
            publicHeadersPath: "include",  // If you want to expose .h files publicly
            cSettings: [
                .headerSearchPath("Sources")  // Specify where to find header files
            ]
        ),
    ]
)
