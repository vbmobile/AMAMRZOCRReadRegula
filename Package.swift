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
        .package(url: "https://github.com/vbmobile/AMANetworkClient", .upToNextMinor(from: "6.0.1")),
        .package(url: "https://github.com/vbmobile/AMAUtils", .upToNextMinor(from: "3.0.4")),
        .package(url: "https://github.com/regulaforensics/DocumentReader-Swift-Package", from: "9.5.6487"),
        .package(url: "https://github.com/regulaforensics/DocumentReaderOCRRFID-Swift-Package", from: "9.5.18270"),
    ],
    targets: [
        .binaryTarget(
            name: "AMAMRZOCRReadRegula",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMAMRZOCRReadRegula/AMAMRZOCRReadRegula-1.1.2.zip",
            checksum: "f445ba12f6e6f25bfff37971d7c6969052e97649a44b3472ca0bcfa847218c1a"
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
