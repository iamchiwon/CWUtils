// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "CWUtils",
    platforms: [
        .iOS(.v10),
    ],
    products: [
        .library(name: "CWUtils", targets: ["CWUtils"]),
        .library(name: "CWUtilsTest", targets: ["CWUtilsTest"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/RxSwiftCommunity/RxSwiftExt", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/RxSwiftCommunity/RxOptional", .upToNextMajor(from: "4.0.0")),
        .package(url: "https://github.com/devxoul/RxViewController", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/SnapKit/SnapKit", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/iamchiwon/Panda", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/AliSoftware/Reusable", .branch("master")),
        .package(url: "https://github.com/devxoul/Then", .upToNextMajor(from: "2.6.0")),
        .package(url: "https://github.com/onevcat/Kingfisher", .upToNextMajor(from: "5.12.0")),
    ],
    targets: [
        .target(name: "CWUtils", dependencies: ["RxSwift", "RxCocoa", "RxSwiftExt", "Then", "Kingfisher", "SnapKit", "Panda", "Reusable"]),
        .target(name: "CWUtilsTest", dependencies: ["CWUtils"]),
        .testTarget(name: "CWUtilsTests", dependencies: ["CWUtils", "CWUtilsTest"]),
    ]
)
