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
        .package(url: "https://github.com/vbmobile/AMADocModel", .upToNextMinor(from: "4.3.0")),
        .package(url: "https://github.com/vbmobile/AMAUtils", .upToNextMinor(from: "3.0.8")),
        .package(url: "https://github.com/vbmobile/AMANetworkClient", .upToNextMinor(from: "7.0.4")),
        .package(url: "https://github.com/regulaforensics/DocumentReader-Swift-Package", .upToNextMinor(from: "9.9.7126")),
        .package(url: "https://github.com/regulaforensics/DocumentReaderOCRRFID-Swift-Package", .upToNextMinor(from: "9.9.21003")),
    ],
    targets: [
        .binaryTarget(
            name: "AMAMRZOCRReadRegula",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMAMRZOCRReadRegula/AMAMRZOCRReadRegula-2.2.0.zip",
            checksum: "e7e4d16079903105d0508782b7c8b989921c71f32e4eea5556ab491a4094945d"
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
