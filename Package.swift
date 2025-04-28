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
            path: "Sources",   // This is where your .h and .m (or .c) files are
            publicHeadersPath: "include",  // Expose headers if needed
            cSettings: [
                .headerSearchPath("Sources")  // If needed to specify where to find header files
            ]
        ),
    ]
)
