// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "AMAMRZOCRReadRegula",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "AMAMRZOCRReadRegula",
            targets: ["AMAMRZOCRReadRegula"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/vbmobile/AMADocModeliOS", .upToNextMinor(from: "2.0.0")),
        .package(url: "https://github.com/vbmobile/VBNetworkClient", exact: "5.1.1"),
        .package(url: "https://github.com/regulaforensics/DocumentReader-Swift-Package", from: "8.3.0"),
        .package(url: "https://github.com/regulaforensics/DocumentReaderMRZRFID-Swift-Package", from: "8.3.0"),
    ],
    targets: [
        .binaryTarget(
            name: "AMAMRZOCRReadRegula",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMAMRZOCRReadRegula/AMAMRZOCRReadRegula-1.0.0-rc03.zip",
            checksum: "c529fb1ca04a3a002a0de3d41bd3f78825ece7eb69a0f3b1e1445ad0ba397bbe"
        )
    ]
)
