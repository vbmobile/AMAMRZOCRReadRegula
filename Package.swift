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
            targets: ["AMAMRZOCRReadRegula", "AMAMRZOCRReadRegulaWrapper"]
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
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMAMRZOCRReadRegula/AMAMRZOCRReadRegula-1.0.0.3.zip",
            checksum: "5bf58f2366b0b4ce29249007a89262854e66134dac3f07691096c3e51f0dc2b1"
        ),
        .target(
            name: "AMAMRZOCRReadRegulaWrapper",
            dependencies: [
                .target(name: "AMAMRZOCRReadRegula"),
                .product(name: "AMADocModeliOS", package: "AMADocModeliOS"),
                .product(name: "VBNetworkClient", package: "VBNetworkClient"),
                .product(name: "DocumentReader", package: "DocumentReader-Swift-Package"),
                .product(name: "MRZRFID", package: "DocumentReaderMRZRFID-Swift-Package"),
            ],
            path: "Sources",
            sources: ["AMAMRZOCRReadRegula.swift"]
        )
    ]
)
