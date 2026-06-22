// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "AMADocScanMrzRegula",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "AMADocScanMrzRegula",
            targets: ["AMADocScanMrzRegulaWrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/vbmobile/AMADocModeliOS", .upToNextMinor(from: "2.0.0")),
        .package(url: "https://github.com/regulaforensics/DocumentReader-Swift-Package", from: "8.3.0"),
    ],
    targets: [
        .binaryTarget(
            name: "AMADocScanMrzRegula",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMADocScanMrzRegula/AMADocScanMrzRegula-1.0.0.zip",
            checksum: "PLACEHOLDER_CHECKSUM"
        ),
        .target(
            name: "AMADocScanMrzRegulaWrapper",
            dependencies: [
                .target(name: "AMADocScanMrzRegula"),
                .product(name: "AMADocModeliOS", package: "AMADocModeliOS"),
                .product(name: "DocumentReader", package: "DocumentReader-Swift-Package"),
            ],
            path: "Sources",
            sources: ["AMADocScanMrzRegula.swift"]
        )
    ]
)
