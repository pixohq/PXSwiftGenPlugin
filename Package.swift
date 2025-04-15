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
      url: "https://github.com/pixohq/PXSwiftGen/releases/download/1.1.0/pxswiftgen-1.1.0.artifactbundle.zip",
      checksum: "cfcd6c01575027189ffda689244582ad8cd39b999d382e61e9f283e1e4034135"
    )
  ]
)
