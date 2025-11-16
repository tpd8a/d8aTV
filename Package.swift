// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "DashboardKit",
    platforms: [
        .macOS(.v14),
        .tvOS(.v17)
    ],
    products: [
        .library(
            name: "DashboardKit",
            targets: ["DashboardKit"]
        ),
        .library(
            name: "d8aTvCore",
            targets: ["d8aTvCore"]
        ),
    ],
    targets: [
        .target(
            name: "DashboardKit",
            dependencies: [],
            resources: [
                .process("CoreData/DashboardModel.xcdatamodeld")
            ]
        ),
        .target(
            name: "d8aTvCore",
            dependencies: []
        ),
        .testTarget(
            name: "DashboardKitTests",
            dependencies: ["DashboardKit"]
        ),
    ]
)
