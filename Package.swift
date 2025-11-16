// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "DashboardStudio",
    platforms: [
        .macOS(.v14),
        .tvOS(.v17)
    ],
    products: [
        .library(
            name: "DashboardStudio",
            targets: ["DashboardStudio"]
        ),
    ],
    targets: [
        .target(
            name: "DashboardStudio",
            dependencies: [],
            resources: [
                .process("CoreData/DashboardModel.xcdatamodeld")
            ]
        ),
        .testTarget(
            name: "DashboardStudioTests",
            dependencies: ["DashboardStudio"]
        ),
    ]
)
