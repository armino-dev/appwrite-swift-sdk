// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.
// Created by Armino <devel@boioiong.com>
// GitHub: https://github.com/armino-dev/appwrite-swift-sdk


import PackageDescription

let package = Package(
    name: "appwrite-swift-sdk",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "appwrite-swift-sdk",
            targets: ["appwrite-swift-sdk"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "appwrite-swift-sdk",
            dependencies: [],
            path: "./Sources/Appwrite"),
        .testTarget(
            name: "appwrite-swift-sdkTests",
            dependencies: ["appwrite-swift-sdk"]),
    ]
)
