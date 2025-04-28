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
            dependencies: [],
            path: "Sources",
            publicHeadersPath: "include", // If you have .h files you want to expose
            cSettings: [
                .headerSearchPath("Sources") // If needed to specify search paths for your C/Obj-C files
            ]
        ),
    ]
)
