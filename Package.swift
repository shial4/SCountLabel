// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SCountLabel",
    products: [
        .library(
            name: "SCountLabel",
            targets: ["SCountLabel"]
        )
    ],
    targets: [
        .target(name: "SCountLabel")
    ]
)

