// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "jwt-keychain-host",
    products: [
        .executable(name: "Run", targets: ["Run"]),
        .library(name: "App", targets: ["App"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/vapor/fluent-provider.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/vapor/mysql-provider.git", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/vapor/redis-provider.git", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/nodes-vapor/bugsnag.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/nodes-vapor/sugar.git", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/nodes-vapor/jwt-keychain.git", .upToNextMinor(from: "0.13.0"))
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                "Vapor",
                "FluentProvider",
                "MySQLProvider",
                "RedisProvider",
                "Bugsnag",
                "Sugar",
                "JWTKeychain"
            ]
        ),
        .target(
            name: "Run",
            dependencies: ["App"]
        )
    ]
)
