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
      url: "https://github.com/pixohq/PXSwiftGen/releases/download/1.0.0/pxswiftgen-1.0.0.artifactbundle.zip",
      checksum: "d91eee8af666477629c21f70a8df228c95cc085389d5ef83f33c77cc51c58522"
    )
  ]
)
