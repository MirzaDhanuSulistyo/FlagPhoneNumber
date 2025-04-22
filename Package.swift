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
    dependencies: [],
    targets: [
        .target(
            name: "FlagPhoneNumber",
            dependencies: [],
            path: "Sources",
            exclude: [
                "Info.plist",
                "FlagPhoneNumber.h",
                "FlagPhoneNumber-Bridging-Header.h"
            ],
            sources: [
                ".",
                "FPNCountryPicker",
                "Helpers",
                "libPhoneNumber"
            ],
            resources: [
                .process("Resources")
            ]
        )
    ]
)
