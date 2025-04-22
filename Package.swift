// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "FlagPhoneNumber",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "FPNCountryPicker",
            targets: ["FPNCountryPicker"]
        ),
    ],
    targets: [
        .target(
            name: "FPNCountryPicker",
            path: "Sources/FPNCountryPicker"
        )
    ]
)
