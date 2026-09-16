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
            targets: ["AMAMRZOCRReadRegulaWrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/vbmobile/AMADocModel", .upToNextMinor(from: "3.1.0")),
        .package(url: "https://github.com/vbmobile/AMANetworkClient", .upToNextMinor(from: "7.0.4")),
        .package(url: "https://github.com/vbmobile/AMAUtils", .upToNextMinor(from: "3.0.8")),
        .package(url: "https://github.com/regulaforensics/DocumentReader-Swift-Package", from: "9.5.6487"),
        .package(url: "https://github.com/regulaforensics/DocumentReaderOCRRFID-Swift-Package", from: "9.5.18270"),
    ],
    targets: [
        .binaryTarget(
            name: "AMAMRZOCRReadRegula",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMAMRZOCRReadRegula/AMAMRZOCRReadRegula-1.2.1.zip",
            checksum: "c5403a3d383160a5794c753cde3399d8c370241068a763f5ff74b99741823b3f"
        ),
        .target(
            name: "AMAMRZOCRReadRegulaWrapper",
            dependencies: [
                .target(name: "AMAMRZOCRReadRegula"),
                .product(name: "AMADocModel", package: "AMADocModel"),
                .product(name: "AMANetworkClient", package: "AMANetworkClient"),
                .product(name: "AMAUtils", package: "AMAUtils"),
                .product(name: "DocumentReader", package: "DocumentReader-Swift-Package"),
                .product(name: "OCRRFID", package: "DocumentReaderOCRRFID-Swift-Package")
            ],
            path: "Sources",
            sources: ["AMAMRZOCRReadRegula.swift"]
        )
    ]
)
