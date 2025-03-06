// swift-tools-version: 5.6
import PackageDescription

let package = Package(
  name: "PXSwiftGenPlugin",
  products: [
    .plugin(name: "PXSwiftGenPlugin", targets: ["PXSwiftGenPlugin"]),
    .plugin(name: "PXSwiftGen-Generate", targets: ["PXSwiftGen-Generate"])
  ],
  dependencies: [],
  targets: [
    .plugin(
      name: "PXSwiftGenPlugin",
      capability: .buildTool(),
      dependencies: ["pxswiftgen"]
    ),
    .plugin(
      name: "PXSwiftGen-Generate",
      capability: .command(
        intent: .custom(
          verb: "generate-code-for-resources",
          description: "Creates type-safe for all your resources"
        ),
        permissions: [
          .writeToPackageDirectory(reason: "This command generates source code")
        ]
      ),
      dependencies: ["pxswiftgen"]
    ),
    .binaryTarget(
      name: "pxswiftgen",
      url: "https://github.com/pixohq/PXSwiftGen/releases/download/1.0.0/swiftgen-1.0.0.artifactbundle.zip",
      checksum: "7586363e24edcf18c2da3ef90f379e9559c1453f48ef5e8fbc0b818fbbc3a045"
    )
  ]
)
