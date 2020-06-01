# Swift SDK for AppWrite

[![Build Status](https://travis-ci.com/armino-dev/appwrite-swift-sdk.svg?branch=master)](https://travis-ci.com/armino-dev/appwrite-swift-sdk)
[![StyleCI](https://github.styleci.io/repos/267389425/shield?branch=master)](https://github.styleci.io/repos/267389425)
![License](https://img.shields.io/github/license/appwrite/appwrite)
![Version](https://img.shields.io/badge/api%20version-0.6.1-blue.svg?v=1)
![Github stars](https://img.shields.io/github/stars/armino-dev/appwrite-swift-sdk)

**WORK IN PROGRESS - NOT READY FOR USAGE**

## Installation

### Install manually using *Swift package manager*

In your application's *Package.swift* file add this package dependency:

```swift
// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YourSwiftApp",
    dependencies: [
        // Here is the AppwriteSwiftSDK dependency declared.
        .package(name: "AppwriteSwiftSDK", url: "https://github.com/armino-dev/appwrite-swift-sdk.git", from: "0.6.4"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "YourSwiftApp",
            // Here is the AppwriteSwiftSDK dependency declared
            dependencies: ["AppwriteSwiftSDK"]),
        .testTarget(
            name: "YourSwiftAppTests",
            dependencies: ["YourSwiftApp"]),
    ]
)
```

### Install using *HomeBrew*

    comming soon

## License

Please see the [BSD-3-Clause license](https://raw.githubusercontent.com/appwrite/appwrite/master/LICENSE) file for more information.
