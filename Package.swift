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
      url: "https://github.com/pixohq/PXSwiftGen/releases/download/1.0.3/pxswiftgen-1.0.3.artifactbundle.zip",
      checksum: "dde6261f7814908b5c743c88c4e6fb8f40158a6131be5c242050250a9e44ba3b"
    )
  ]
)
